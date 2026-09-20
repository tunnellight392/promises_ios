//
//  VerseRepository.swift
//  Promises
//

import Foundation

/// Offline access to the bundled promises, both grouped by topic (for Browse)
/// and flattened (for the daily verse, shuffle, and swipe navigation).
///
/// A verse's position in the flattened collection is its stable "global index",
/// which is what the screens pass around to refer to a particular verse.
struct VerseRepository: Sendable {

    static let shared = VerseRepository()

    /// Topics in alphabetical order, matching the order of the tile photos.
    let topics: [Topic]

    /// Every verse, in topic order; the position here is the global index.
    let all: [Verse]

    /// The global index of each topic's first verse, parallel to `topics`.
    private let topicStarts: [Int]

    /// How many tile photos ship with the app; topics wrap around them.
    private static let topicImageCount = 16

    private init() {
        var flattened: [Verse] = []
        var starts: [Int] = []
        for topic in VerseData.topics {
            starts.append(flattened.count)
            flattened.append(contentsOf: topic.verses)
        }
        topics = VerseData.topics
        all = flattened
        topicStarts = starts
    }

    var count: Int { all.count }

    subscript(index: Int) -> Verse {
        all[wrapped(index)]
    }

    /// The global index of the verse at `verseIndex` within the topic at `topicIndex`.
    func globalIndex(topicIndex: Int, verseIndex: Int) -> Int {
        topicStarts[topicIndex] + verseIndex
    }

    /// The asset name of the tile photo for the topic at `topicIndex`.
    func topicImageName(topicIndex: Int) -> String {
        "topic_\(topicIndex % Self.topicImageCount)"
    }

    // MARK: - Choosing a verse

    /// The verse index for a given day. Stable for the whole calendar day and
    /// across launches, advancing by one each day.
    func index(for date: Date, calendar: Calendar = .current) -> Int {
        wrapped(Self.dayNumber(for: date, calendar: calendar))
    }

    /// A random index different from `current` (when possible).
    func randomIndex(excluding current: Int) -> Int {
        guard count > 1 else { return 0 }
        var next = current
        while next == current {
            next = Int.random(in: 0..<count)
        }
        return next
    }

    /// Steps `index` by `offset`, wrapping around at both ends.
    func index(_ index: Int, offsetBy offset: Int) -> Int {
        wrapped(index + offset)
    }

    /// The number of whole days from the epoch to `date`, in the given calendar.
    /// Used so the daily verse advances exactly once per local calendar day.
    private static func dayNumber(for date: Date, calendar: Calendar) -> Int {
        let epoch = calendar.startOfDay(for: Date(timeIntervalSince1970: 0))
        let day = calendar.startOfDay(for: date)
        return calendar.dateComponents([.day], from: epoch, to: day).day ?? 0
    }

    /// Brings any integer into `0..<count`, including negatives.
    private func wrapped(_ index: Int) -> Int {
        guard count > 0 else { return 0 }
        let remainder = index % count
        return remainder < 0 ? remainder + count : remainder
    }
}
