//
//  ReadingView.swift
//  Promises
//

import SwiftUI

/// Adjusts how verse text reads: its size and font family, with a live preview.
///
/// These sit on top of the system's Dynamic Type setting rather than replacing
/// it, so the verse still follows the text size chosen in iOS Settings.
struct ReadingView: View {

    /// The passage shown in the preview.
    private static let sample = VerseRepository.shared.all
        .first { $0.reference == "Psalm 23:1" } ?? VerseRepository.shared[0]

    @Environment(\.dynamicTypeSize) private var typeSize

    @AppStorage(PrefKey.bibleVersion) private var version: BibleVersion = .web
    @AppStorage(PrefKey.textSize) private var textSize: TextSize = .medium
    @AppStorage(PrefKey.fontChoice) private var fontChoice: FontChoice = .serif

    var body: some View {
        Form {
            Section("Preview") {
                VStack(spacing: 12) {
                    Text(Self.sample.text(in: version))
                        .italic(version == .web)
                        .font(.reading(.title3, font: fontChoice, scale: textSize.verseScale(for: version), typeSize: typeSize))
                        .multilineTextAlignment(.center)

                    Text("\(Self.sample.reference(in: version)) (\(version.tag))")
                        .font(.reading(.footnote, font: fontChoice, scale: textSize.scale, typeSize: typeSize).weight(.semibold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .animation(.smooth, value: textSize)
                .animation(.smooth, value: fontChoice)
            }

            Section {
                Slider(
                    value: sizeSelection,
                    in: 0...Double(TextSize.allCases.count - 1),
                    step: 1
                ) {
                    Text("Text Size")
                } minimumValueLabel: {
                    Text("A").font(.footnote)
                } maximumValueLabel: {
                    Text("A").font(.title3)
                }
                .accessibilityValue(textSize.label)
            } header: {
                Text("Text Size")
            } footer: {
                Text(textSize.label)
            }

            Section("Font") {
                Picker("Font", selection: $fontChoice) {
                    ForEach(FontChoice.allCases) { choice in
                        Text(choice.label)
                            .font(.system(.body, design: choice.design))
                            .tag(choice)
                    }
                }
                .pickerStyle(.inline)
                .labelsHidden()
            }
        }
        .navigationTitle("Text & Font")
        .navigationBarTitleDisplayMode(.inline)
    }

    /// Bridges the stored `TextSize` to the slider's continuous value.
    private var sizeSelection: Binding<Double> {
        Binding {
            Double(textSize.rawValue)
        } set: { newValue in
            textSize = TextSize(rawValue: Int(newValue.rounded())) ?? .medium
        }
    }
}

#Preview {
    NavigationStack {
        ReadingView()
    }
}
