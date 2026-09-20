//
//  VerseOfTheDayView.swift
//  Promises
//

import SwiftUI

/// The home screen: today's promise set over a nature photograph.
///
/// The verse is stable for the whole calendar day. Swiping left or right moves
/// through the collection — changing the photo as it goes — and the toolbar
/// carries the save, share, shuffle, and browse actions.
struct VerseOfTheDayView: View {

    /// The nature photographs the screen cycles through.
    private static let backgrounds = (1...6).map { "nature_\($0)" }

    /// How far a horizontal drag must travel to count as a swipe.
    private static let swipeThreshold: CGFloat = 60

    @Environment(FavoritesStore.self) private var favorites

    @AppStorage(PrefKey.bibleVersion) private var version: BibleVersion = .web
    @AppStorage(PrefKey.textSize) private var textSize: TextSize = .medium
    @AppStorage(PrefKey.fontChoice) private var fontChoice: FontChoice = .serif

    @State private var index = VerseRepository.shared.index(for: .now)
    @State private var dragOffset: CGFloat = 0
    @State private var isBrowsing = false
    @State private var isShowingSettings = false
    @State private var isShowingFeedback = false

    private let repository = VerseRepository.shared

    private var verse: Verse { repository[index] }

    private var isFavorite: Bool { favorites.isFavorite(verse) }

    private var backgroundName: String {
        Self.backgrounds[index % Self.backgrounds.count]
    }

    private var shareText: String {
        verse.sharingText(in: version) + "\n\nvia Promises"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                background
                LinearGradient.verseScrim.ignoresSafeArea()
                content
            }
            .contentShape(.rect)
            .gesture(swipe)
            .navigationTitle("Promise of the Day")
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar { toolbarContent }
        }
        .sheet(isPresented: $isBrowsing) {
            BrowseView { selected in
                withAnimation(.smooth(duration: 0.4)) { index = selected }
            }
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView()
        }
        .sheet(isPresented: $isShowingFeedback) {
            NavigationStack {
                FeedbackView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") { isShowingFeedback = false }
                        }
                    }
            }
        }
    }

    // MARK: - Layers

    private var background: some View {
        GeometryReader { proxy in
            Image(backgroundName)
                .resizable()
                .scaledToFill()
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
                .id(backgroundName)
                .transition(.opacity)
        }
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }

    private var content: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)

            verseBlock
                .padding(.horizontal, 28)
                .offset(x: dragOffset / 2)
                .opacity(1 - min(abs(dragOffset) / 400, 0.7))

            Spacer(minLength: 0)

            Text(version.attribution)
                .font(.caption2)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.75))
                .padding(.horizontal, 32)
        }
    }

    private var verseBlock: some View {
        VStack(spacing: 18) {
            Image(systemName: "quote.opening")
                .font(.system(size: 28))
                .foregroundStyle(Color.promiseGold.opacity(0.75))
                .accessibilityHidden(true)

            Text(verse.text(in: version))
                // Malayalam has no true italic form, so only slant the English text.
                .italic(version == .web)
                .font(.reading(.title2, font: fontChoice, scale: textSize.verseScale(for: version)))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.55), radius: 8, y: 2)

            Text("\(verse.reference(in: version)) (\(version.tag))")
                .font(.reading(.subheadline, font: fontChoice, scale: textSize.scale).weight(.semibold))
                .foregroundStyle(Color.promiseGold)
                .shadow(color: .black.opacity(0.5), radius: 6, y: 2)
        }
        .id(index)
        .transition(.blurReplace)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(verse.text(in: version)). \(verse.reference(in: version)).")
        .accessibilityHint("Swipe left or right with two fingers to read another promise.")
    }

    // MARK: - Toolbar

    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                withAnimation(.snappy) { favorites.toggle(verse) }
            } label: {
                Label(
                    isFavorite ? "Remove from Favorites" : "Add to Favorites",
                    systemImage: isFavorite ? "heart.fill" : "heart"
                )
            }
            .tint(isFavorite ? .red : .white)
        }

        ToolbarItem(placement: .topBarTrailing) {
            ShareLink(item: shareText) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }

        ToolbarItem(placement: .topBarTrailing) {
            Menu("More", systemImage: "ellipsis") {
                Button("Settings", systemImage: "gearshape") { isShowingSettings = true }
                Button("Send Feedback", systemImage: "envelope") { isShowingFeedback = true }
            }
        }

        ToolbarItem(placement: .bottomBar) {
            Button("Next Promise", systemImage: "shuffle", action: shuffle)
        }

        ToolbarSpacer(.flexible, placement: .bottomBar)

        ToolbarItem(placement: .bottomBar) {
            Button("Browse", systemImage: "square.grid.2x2") { isBrowsing = true }
        }
    }

    // MARK: - Navigation

    private var swipe: some Gesture {
        DragGesture(minimumDistance: 20)
            .onChanged { value in
                dragOffset = value.translation.width
            }
            .onEnded { value in
                let distance = value.translation.width
                withAnimation(.smooth(duration: 0.35)) {
                    dragOffset = 0
                    if distance <= -Self.swipeThreshold {
                        index = repository.index(index, offsetBy: 1)
                    } else if distance >= Self.swipeThreshold {
                        index = repository.index(index, offsetBy: -1)
                    }
                }
            }
    }

    private func shuffle() {
        withAnimation(.smooth(duration: 0.4)) {
            index = repository.randomIndex(excluding: index)
        }
    }
}

#Preview {
    VerseOfTheDayView()
        .environment(FavoritesStore())
}
