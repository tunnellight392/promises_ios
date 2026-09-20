//
//  FeedbackView.swift
//  Promises
//

import SwiftUI

/// Sends feedback, feature requests, or new verse suggestions to the app's
/// mailbox by handing a pre-filled message to the user's mail app.
struct FeedbackView: View {

    private static let address = "tunnellightt392@gmail.com"
    private static let subject = "Promises app feedback"

    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL

    @State private var message = ""
    @State private var isShowingNoMailAlert = false

    private var trimmedMessage: String {
        message.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        Form {
            Section {
                TextField(
                    "Feedback, feature requests, or a verse to add",
                    text: $message,
                    axis: .vertical
                )
                .lineLimit(6...)
            } footer: {
                Text("We'd love to hear from you. Your message opens in Mail, ready to send.")
            }
        }
        .navigationTitle("Feedback")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Send", action: send)
                    .disabled(trimmedMessage.isEmpty)
            }
        }
        .alert("No Mail Account", isPresented: $isShowingNoMailAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Set up a mail account on this device, or write to \(Self.address).")
        }
    }

    private func send() {
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = Self.address
        components.queryItems = [
            URLQueryItem(name: "subject", value: Self.subject),
            URLQueryItem(name: "body", value: trimmedMessage),
        ]
        guard let url = components.url else { return }

        openURL(url) { accepted in
            if accepted {
                dismiss()
            } else {
                isShowingNoMailAlert = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedbackView()
    }
}
