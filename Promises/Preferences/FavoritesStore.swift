//
//  FavoritesStore.swift
//  Promises
//

import Foundation
import Observation

/// The user's saved verses, persisted in user defaults.
///
/// Verses are keyed by their English reference (e.g. "Psalm 23:1"), which stays
/// stable if the bundled collection is reordered or the Bible version changes.
@Observable
final class FavoritesStore {

    private(set) var references: Set<String>

    @ObservationIgnored
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        let saved = defaults.stringArray(forKey: PrefKey.favorites) ?? []
        self.references = Set(saved)
    }

    var isEmpty: Bool { references.isEmpty }

    func isFavorite(_ verse: Verse) -> Bool {
        references.contains(verse.reference)
    }

    /// Flips the saved state of `verse`.
    func toggle(_ verse: Verse) {
        if references.contains(verse.reference) {
            references.remove(verse.reference)
        } else {
            references.insert(verse.reference)
        }
        defaults.set(Array(references), forKey: PrefKey.favorites)
    }
}
