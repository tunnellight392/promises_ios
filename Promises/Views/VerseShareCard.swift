//
//  VerseShareCard.swift
//  Promises
//

import SwiftUI

/// A fixed-size, portrait card of a verse over its background photo, laid out
/// for rendering to an image that can be shared to messages or social posts.
struct VerseShareCard: View {

    /// The card's size in points; rendered at 3× this is 1080 × 1350 pixels,
    /// the standard 4:5 portrait size for social posts.
    static let size = CGSize(width: 360, height: 450)

    let verse: Verse
    let version: BibleVersion
    let fontChoice: FontChoice
    let backgroundName: String

    var body: some View {
        ZStack {
            Image(backgroundName)
                .resizable()
                .scaledToFill()
                .frame(width: Self.size.width, height: Self.size.height)
                .clipped()

            LinearGradient.verseScrim

            VStack(spacing: 14) {
                Spacer(minLength: 0)

                Image(systemName: "quote.opening")
                    .font(.system(size: 24))
                    .foregroundStyle(Color.promiseGold.opacity(0.75))

                Text(verse.text(in: version))
                    // Malayalam has no true italic form, so only slant the English text.
                    .italic(version == .web)
                    .font(.system(size: version == .malayalam ? 20 : 24, design: fontChoice.design))
                    // Long verses shrink to fit the fixed card rather than truncating.
                    .minimumScaleFactor(0.4)
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.55), radius: 8, y: 2)

                Text("\(verse.reference(in: version)) (\(version.tag))")
                    .font(.system(size: 15, weight: .semibold, design: fontChoice.design))
                    .foregroundStyle(Color.promiseGold)
                    .shadow(color: .black.opacity(0.5), radius: 6, y: 2)

                Spacer(minLength: 0)

                Text("Promises")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.75))
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 24)
        }
        .frame(width: Self.size.width, height: Self.size.height)
        // The card is always light-on-dark, whatever the system appearance.
        .environment(\.colorScheme, .dark)
    }

    /// Renders the card to an image suitable for sharing.
    @MainActor
    func renderImage() -> Image? {
        let renderer = ImageRenderer(content: self)
        renderer.scale = 3
        guard let uiImage = renderer.uiImage else { return nil }
        return Image(uiImage: uiImage)
    }
}

#Preview {
    VerseShareCard(
        verse: VerseRepository.shared[0],
        version: .web,
        fontChoice: .serif,
        backgroundName: "nature_1"
    )
}
