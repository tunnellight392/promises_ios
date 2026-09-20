//
//  Preferences.swift
//  Promises
//

import SwiftUI

/// User-defaults keys. Kept in one place so the app and its preference views
/// can't drift apart.
enum PrefKey {
    static let bibleVersion = "bible_version"
    static let textSize = "font_size_index"
    static let fontChoice = "font_type"
    static let theme = "theme_mode"
    static let notificationsEnabled = "notif_enabled"
    static let notificationHour = "notif_hour"
    static let notificationMinute = "notif_minute"
    static let favorites = "favorite_refs"
}

/// Which colour scheme the app should use, regardless of the system setting.
///
/// Raw values are persisted, so keep them stable.
enum ThemeChoice: Int, CaseIterable, Identifiable {
    case system = 0
    case light = 1
    case dark = 2

    var id: Int { rawValue }

    var label: String {
        switch self {
        case .system: "System"
        case .light: "Light"
        case .dark: "Dark"
        }
    }

    /// `nil` follows the system setting.
    var colorScheme: ColorScheme? {
        switch self {
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }
}

/// The reading size for verse text, on top of the system's Dynamic Type setting.
///
/// Raw values are persisted, so keep the order stable.
enum TextSize: Int, CaseIterable, Identifiable {
    case small = 0
    case medium = 1
    case large = 2
    case extraLarge = 3

    var id: Int { rawValue }

    var label: String {
        switch self {
        case .small: "Small"
        case .medium: "Medium"
        case .large: "Large"
        case .extraLarge: "Extra Large"
        }
    }

    /// The multiplier applied to base text sizes.
    var scale: CGFloat {
        switch self {
        case .small: 0.85
        case .medium: 1.0
        case .large: 1.2
        case .extraLarge: 1.45
        }
    }

    /// The multiplier for the verse body in Malayalam. Malayalam stacks vowel
    /// marks above and below the line, so the script is taller and its (often
    /// longer) verses need a gentler scale to stay comfortable to read.
    var malayalamScale: CGFloat {
        switch self {
        case .small: 0.7
        case .medium: 0.8
        case .large: 0.85
        case .extraLarge: 0.9
        }
    }

    /// The multiplier for the verse body in the given version.
    func verseScale(for version: BibleVersion) -> CGFloat {
        version == .malayalam ? malayalamScale : scale
    }
}

/// The font family used for verse text.
///
/// Raw values are persisted, so keep them stable.
enum FontChoice: Int, CaseIterable, Identifiable {
    case serif = 0
    case sansSerif = 1
    case monospace = 2

    var id: Int { rawValue }

    var label: String {
        switch self {
        case .serif: "Serif"
        case .sansSerif: "Sans Serif"
        case .monospace: "Monospace"
        }
    }

    var design: Font.Design {
        switch self {
        case .serif: .serif
        case .sansSerif: .default
        case .monospace: .monospaced
        }
    }
}

extension Font {
    /// A font built from a Dynamic Type text style — so it still follows the
    /// system's text size — in the user's chosen family, then multiplied by their
    /// in-app reading size.
    static func reading(
        _ style: Font.TextStyle,
        font: FontChoice,
        scale: CGFloat = 1
    ) -> Font {
        .system(style, design: font.design).scaled(by: scale)
    }
}
