//
//  Verse.swift
//  Promises
//

import Foundation

/// The Bible translations bundled with the app, both public domain.
///
/// Raw values are persisted in user defaults, so keep them stable.
enum BibleVersion: Int, CaseIterable, Identifiable {
    /// World English Bible — the default English version.
    case web = 0
    /// Malayalam Sathyavedapusthakam / Old Version.
    case malayalam = 1

    var id: Int { rawValue }

    /// The full name shown in the version chooser.
    var displayName: String {
        switch self {
        case .web: "English — World English Bible (WEB)"
        case .malayalam: "Malayalam — സത്യവേദപുസ്തകം (O.V.)"
        }
    }

    /// The concise label shown as the current value on the Settings row.
    var shortName: String {
        switch self {
        case .web: "English"
        case .malayalam: "Malayalam"
        }
    }

    /// Short translation tag shown after a reference.
    var tag: String {
        switch self {
        case .web: "WEB"
        case .malayalam: "സത്യവേദപുസ്തകം"
        }
    }

    /// The courtesy attribution line shown beneath the verse.
    var attribution: String {
        switch self {
        case .web:
            "Scripture quotations are from the World English Bible (WEB). Public domain."
        case .malayalam:
            "തിരുവെഴുത്തുകൾ സത്യവേദപുസ്തകത്തിൽനിന്ന് (Malayalam O.V.). പൊതുസഞ്ചയം (public domain)."
        }
    }
}

/// A single Scripture passage, carrying its text in every supported Bible version.
///
/// Deliberately not `Identifiable`: a handful of passages appear under more than
/// one topic, so the reference isn't unique across the flattened collection. Use
/// the verse's global index (see `VerseRepository`) as identity instead.
struct Verse: Hashable, Sendable {
    /// The English reference, e.g. "Psalm 23:1". This is the stable key favorites
    /// are saved under, so it never changes with the selected version.
    let reference: String
    let web: String
    let malayalam: String

    /// The verse text in the given version.
    func text(in version: BibleVersion) -> String {
        version == .malayalam ? malayalam : web
    }

    /// The reference with its book name localized for the given version.
    func reference(in version: BibleVersion) -> String {
        BibleBooks.localizedReference(reference, version: version)
    }

    /// Formatted for sharing, e.g. to a messaging app or a social post.
    func sharingText(in version: BibleVersion) -> String {
        "“\(text(in: version))”\n— \(reference(in: version)) (\(version.tag))"
    }
}

/// A named group of verses; the grouping powers the Browse screen.
struct Topic: Hashable, Identifiable, Sendable {
    let name: String
    let verses: [Verse]

    var id: String { name }
}
