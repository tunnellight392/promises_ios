//
//  SettingsView.swift
//  Promises
//

import SwiftUI
import UIKit

/// App settings: the daily notification, the translation, reading text, and theme.
struct SettingsView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL

    @AppStorage(PrefKey.bibleVersion) private var version: BibleVersion = .web
    @AppStorage(PrefKey.theme) private var theme: ThemeChoice = .system
    @AppStorage(PrefKey.textSize) private var textSize: TextSize = .medium
    @AppStorage(PrefKey.fontChoice) private var fontChoice: FontChoice = .serif
    @AppStorage(PrefKey.notificationsEnabled) private var notificationsEnabled = false
    @AppStorage(PrefKey.notificationHour) private var notificationHour = 8
    @AppStorage(PrefKey.notificationMinute) private var notificationMinute = 0

    @State private var isShowingPermissionAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Daily Promise", isOn: $notificationsEnabled)
                    if notificationsEnabled {
                        DatePicker(
                            "Time",
                            selection: notificationTime,
                            displayedComponents: .hourAndMinute
                        )
                    }
                } header: {
                    Text("Notifications")
                } footer: {
                    Text("Receive the promise of the day at a time you choose.")
                }

                Section("Reading") {
                    Picker("Bible Version", selection: $version) {
                        ForEach(BibleVersion.allCases) { version in
                            Text(version.displayName).tag(version)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    NavigationLink {
                        ReadingView()
                    } label: {
                        LabeledContent("Text & Font", value: textSize.label)
                    }
                }

                Section("Appearance") {
                    Picker("Theme", selection: $theme) {
                        ForEach(ThemeChoice.allCases) { theme in
                            Text(theme.label).tag(theme)
                        }
                    }
                }

                Section {
                    NavigationLink("Send Feedback") { FeedbackView() }
                } footer: {
                    Text(version.attribution)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .onChange(of: notificationsEnabled) { _, isOn in
                Task { await notificationsToggled(on: isOn) }
            }
            .onChange(of: notificationHour) { _, _ in rescheduleIfEnabled() }
            .onChange(of: notificationMinute) { _, _ in rescheduleIfEnabled() }
            .onChange(of: version) { _, _ in rescheduleIfEnabled() }
            .alert("Notifications Are Turned Off", isPresented: $isShowingPermissionAlert) {
                Button("Open Settings") {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        openURL(url)
                    }
                }
                Button("Not Now", role: .cancel) { }
            } message: {
                Text("Allow notifications for Promises in Settings to receive the daily promise.")
            }
        }
    }

    // MARK: - Notifications

    /// Bridges the stored hour and minute to the `DatePicker`'s `Date`.
    private var notificationTime: Binding<Date> {
        Binding {
            Calendar.current.date(
                bySettingHour: notificationHour, minute: notificationMinute, second: 0, of: .now
            ) ?? .now
        } set: { newValue in
            let components = Calendar.current.dateComponents([.hour, .minute], from: newValue)
            notificationHour = components.hour ?? notificationHour
            notificationMinute = components.minute ?? notificationMinute
        }
    }

    private func notificationsToggled(on isOn: Bool) async {
        guard isOn else {
            NotificationScheduler.cancelAll()
            return
        }
        guard await NotificationScheduler.requestAuthorization() else {
            notificationsEnabled = false
            isShowingPermissionAlert = true
            return
        }
        await NotificationScheduler.reschedule(
            hour: notificationHour, minute: notificationMinute, version: version
        )
    }

    private func rescheduleIfEnabled() {
        guard notificationsEnabled else { return }
        Task {
            await NotificationScheduler.reschedule(
                hour: notificationHour, minute: notificationMinute, version: version
            )
        }
    }
}

#Preview {
    SettingsView()
}
