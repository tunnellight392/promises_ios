//
//  BrowseView.swift
//  Promises
//

import SwiftUI

/// Browse every promise, grouped by topic, and pick one to read.
///
/// Topics drill down into their verses rather than expanding in place, which is
/// the pattern people expect from a list on iOS.
struct BrowseView: View {

    /// Called with the global index of the verse the user picked.
    let onSelect: (Int) -> Void

    @Environment(\.dismiss) private var dismiss
    @Environment(FavoritesStore.self) private var favorites

    @AppStorage(PrefKey.bibleVersion) private var version: BibleVersion = .web

    @State private var searchText = ""

    private let repository = VerseRepository.shared

    var body: some View {
        NavigationStack {
            List {
                if let saved = savedTopic, searchText.isEmpty {
                    Section {
                        row(for: saved)
                    }
                }

                Section("Topics") {
                    ForEach(matchingTopics) { topic in
                        row(for: topic)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search topics")
            .navigationTitle("Browse")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .overlay {
                if matchingTopics.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }

    private func row(for topic: BrowseTopic) -> some View {
        NavigationLink {
            TopicVersesView(topic: topic, version: version, onSelect: select)
        } label: {
            BrowseTopicRow(topic: topic)
        }
    }

    /// Hands the chosen verse back to the home screen and closes Browse.
    private func select(_ index: Int) {
        onSelect(index)
        dismiss()
    }

    // MARK: - Contents

    /// Every bundled topic, with each verse paired to its global index.
    private var allTopics: [BrowseTopic] {
        repository.topics.enumerated().map { topicIndex, topic in
            BrowseTopic(
                id: topic.name,
                name: topic.name,
                imageName: repository.topicImageName(topicIndex: topicIndex),
                verses: topic.verses.enumerated().map { verseIndex, verse in
                    BrowseVerse(
                        id: repository.globalIndex(topicIndex: topicIndex, verseIndex: verseIndex),
                        verse: verse
                    )
                }
            )
        }
    }

    private var matchingTopics: [BrowseTopic] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return allTopics }
        return allTopics.filter { $0.name.localizedStandardContains(query) }
    }

    /// The synthetic Favorites group, or `nil` when nothing is saved yet.
    private var savedTopic: BrowseTopic? {
        let saved = repository.all.enumerated()
            .filter { favorites.references.contains($0.element.reference) }
            .map { BrowseVerse(id: $0.offset, verse: $0.element) }
        guard !saved.isEmpty else { return nil }
        return BrowseTopic(id: "favorites", name: "Favorites", imageName: nil, verses: saved)
    }
}

// MARK: - Model

/// A topic as shown in Browse: either a bundled topic, which owns a tile photo,
/// or the synthetic Favorites group gathered from the user's saved verses.
private struct BrowseTopic: Identifiable {
    let id: String
    let name: String
    /// The tile photo, or `nil` for the Favorites group.
    let imageName: String?
    let verses: [BrowseVerse]
}

/// A verse together with its global index — unique, unlike the reference, which
/// a handful of passages share across topics.
private struct BrowseVerse: Identifiable {
    let id: Int
    let verse: Verse
}

// MARK: - Rows

private struct BrowseTopicRow: View {
    let topic: BrowseTopic

    var body: some View {
        HStack(spacing: 14) {
            thumbnail
            VStack(alignment: .leading, spacing: 2) {
                Text(topic.name)
                Text("^[\(topic.verses.count) promise](inflect: true)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    @ViewBuilder
    private var thumbnail: some View {
        if let imageName = topic.imageName {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(.rect(cornerRadius: 10))
        } else {
            Image(systemName: "heart.fill")
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 52, height: 52)
                .background(
                    LinearGradient(
                        colors: [.pink, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    in: .rect(cornerRadius: 10)
                )
        }
    }
}

/// The verses within one topic; tapping one shows it on the home screen.
private struct TopicVersesView: View {
    let topic: BrowseTopic
    let version: BibleVersion
    let onSelect: (Int) -> Void

    @Environment(FavoritesStore.self) private var favorites

    var body: some View {
        List(topic.verses) { item in
            Button {
                onSelect(item.id)
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.verse.text(in: version))
                        .font(.callout)
                        .foregroundStyle(.primary)
                    Text("\(item.verse.reference(in: version)) (\(version.tag))")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(.rect)
                .padding(.vertical, 2)
            }
            .buttonStyle(.plain)
            .swipeActions(edge: .leading) {
                Button {
                    favorites.toggle(item.verse)
                } label: {
                    Label(
                        favorites.isFavorite(item.verse) ? "Unsave" : "Save",
                        systemImage: favorites.isFavorite(item.verse) ? "heart.slash" : "heart"
                    )
                }
                .tint(.pink)
            }
        }
        .navigationTitle(topic.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BrowseView { _ in }
        .environment(FavoritesStore())
}
