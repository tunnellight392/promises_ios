//
//  BibleBooks.swift
//  Promises
//

import Foundation

/// Maps the English book-name prefix of a verse reference to its Malayalam
/// Sathyavedapusthakam name, so "Isaiah 61:3" can display in its Malayalam form
/// when that version is selected. The English reference stays the stable key for
/// favorites; only the on-screen book name changes (chapter:verse digits are kept).
enum BibleBooks {

    private static let malayalam: [String: String] = [
        "Numbers": "സംഖ്യാപുസ്തകം",
        "Deuteronomy": "ആവര്‍ത്തനപുസ്തകം",
        "Joshua": "യോശുവ",
        "Nehemiah": "നെഹെമ്യാവ്",
        "Psalm": "സങ്കീര്‍ത്തനങ്ങള്‍",
        "Proverbs": "സദൃശവാക്യങ്ങള്‍",
        "Isaiah": "യെശയ്യാവ്",
        "Jeremiah": "യിരെമ്യാവ്",
        "Lamentations": "വിലാപങ്ങള്‍",
        "Micah": "മീഖാ",
        "Zephaniah": "സെഫന്യാവ്",
        "Matthew": "മത്തായി",
        "Mark": "മര്‍ക്കൊസ്",
        "John": "യോഹന്നാന്‍",
        "Acts": "അപ്പൊ. പ്രവൃത്തികള്‍",
        "Romans": "റോമര്‍",
        "1 Corinthians": "1 കൊരിന്ത്യര്‍",
        "2 Corinthians": "2 കൊരിന്ത്യര്‍",
        "Galatians": "ഗലാത്യര്‍",
        "Ephesians": "എഫെസ്യര്‍",
        "Philippians": "ഫിലിപ്പിയര്‍",
        "Colossians": "കൊലൊസ്സ്യര്‍",
        "1 Thessalonians": "1 തെസ്സലൊനീക്യര്‍",
        "2 Timothy": "2 തിമൊഥെയൊസ്",
        "Hebrews": "എബ്രായര്‍",
        "James": "യാക്കോബ്",
        "1 Peter": "1 പത്രൊസ്",
        "1 John": "1 യോഹന്നാന്‍",
        "Revelation": "വെളിപ്പാട്",
    ]

    /// The reference formatted for display in the given Bible version. For Malayalam
    /// the book-name prefix is localized; otherwise (or if the book is unmapped) the
    /// English reference is returned unchanged.
    static func localizedReference(_ reference: String, version: BibleVersion) -> String {
        guard version == .malayalam,
              let split = reference.lastIndex(of: " "),
              let book = malayalam[String(reference[reference.startIndex..<split])]
        else { return reference }
        return book + reference[split...]
    }
}
