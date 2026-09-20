//
//  Theme.swift
//  Promises
//

import SwiftUI

extension Color {
    /// The warm gold used for the brand mark and verse references.
    static let promiseGold = Color(red: 1.0, green: 0.824, blue: 0.498)

    /// The deep evening blue behind the app's nature photography.
    static let promiseSky = Color(red: 0.106, green: 0.227, blue: 0.357)
}

extension LinearGradient {
    /// The readability scrim drawn over the background photo — darkest at the top
    /// and bottom, where the toolbars and the attribution sit.
    static let verseScrim = LinearGradient(
        stops: [
            .init(color: .black.opacity(0.55), location: 0),
            .init(color: .black.opacity(0.25), location: 0.30),
            .init(color: .black.opacity(0.30), location: 0.60),
            .init(color: .black.opacity(0.70), location: 1),
        ],
        startPoint: .top,
        endPoint: .bottom
    )
}
