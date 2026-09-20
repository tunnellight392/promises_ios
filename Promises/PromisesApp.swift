//
//  PromisesApp.swift
//  Promises
//
//  Created by Alex Therakathu on 9/19/26.
//

import SwiftUI

@main
struct PromisesApp: App {

    @AppStorage(PrefKey.theme) private var theme: ThemeChoice = .system
    @AppStorage(PrefKey.bibleVersion) private var version: BibleVersion = .web
    @AppStorage(PrefKey.notificationsEnabled) private var notificationsEnabled = false
    @AppStorage(PrefKey.notificationHour) private var notificationHour = 8
    @AppStorage(PrefKey.notificationMinute) private var notificationMinute = 0

    @Environment(\.scenePhase) private var scenePhase

    @State private var favorites = FavoritesStore()

    var body: some Scene {
        WindowGroup {
            VerseOfTheDayView()
                .environment(favorites)
                .preferredColorScheme(theme.colorScheme)
                .onChange(of: scenePhase) { _, phase in
                    // Daily notifications are queued a couple of months ahead, so
                    // top the queue back up each time the app comes forward.
                    guard phase == .active, notificationsEnabled else { return }
                    Task {
                        await NotificationScheduler.reschedule(
                            hour: notificationHour,
                            minute: notificationMinute,
                            version: version
                        )
                    }
                }
        }
    }
}
