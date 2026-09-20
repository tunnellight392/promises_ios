//
//  NotificationScheduler.swift
//  Promises
//

import Foundation
import UserNotifications

/// Schedules the daily promise notification.
///
/// A single repeating trigger would deliver the same fixed text every day, so
/// instead we queue one request per day — each carrying that day's verse — and
/// top the queue back up whenever the app becomes active. iOS keeps at most 64
/// pending requests per app, so `scheduledDayCount` stays comfortably under that.
enum NotificationScheduler {

    private static let identifierPrefix = "daily_verse_"
    private static let scheduledDayCount = 60

    // MARK: - Authorization

    /// Asks for permission to post notifications, returning whether it was granted.
    static func requestAuthorization() async -> Bool {
        do {
            return try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound])
        } catch {
            return false
        }
    }

    /// Whether the user has notifications turned on for the app in Settings.
    static func isAuthorized() async -> Bool {
        let status = await UNUserNotificationCenter.current()
            .notificationSettings()
            .authorizationStatus
        return status == .authorized || status == .provisional
    }

    // MARK: - Scheduling

    /// Replaces the pending queue with one notification per day at `hour`:`minute`,
    /// each carrying that day's verse in `version`.
    static func reschedule(hour: Int, minute: Int, version: BibleVersion) async {
        let center = UNUserNotificationCenter.current()
        cancelAll()

        guard await isAuthorized() else { return }

        let repository = VerseRepository.shared
        let calendar = Calendar.current
        let now = Date()

        for dayOffset in 0..<scheduledDayCount {
            guard let day = calendar.date(byAdding: .day, value: dayOffset, to: now),
                  let fireDate = calendar.date(
                    bySettingHour: hour, minute: minute, second: 0, of: day
                  ),
                  fireDate > now
            else { continue }

            let verse = repository[repository.index(for: fireDate, calendar: calendar)]

            let content = UNMutableNotificationContent()
            content.title = "Promise of the Day"
            content.body = verse.text(in: version)
            content.subtitle = "\(verse.reference(in: version)) (\(version.tag))"
            content.sound = .default

            let components = calendar.dateComponents(
                [.year, .month, .day, .hour, .minute], from: fireDate
            )
            let request = UNNotificationRequest(
                identifier: identifierPrefix + String(dayOffset),
                content: content,
                trigger: UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            )
            try? await center.add(request)
        }
    }

    /// Removes every pending daily-verse notification.
    static func cancelAll() {
        let identifiers = (0..<scheduledDayCount).map { identifierPrefix + String($0) }
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}
