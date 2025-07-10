//
//  Track.swift
//  iShuffMan
//
//  Created by Jay on 7/9/25.
//

import Foundation

struct Track: Identifiable, Codable {
    let id: UUID
    var title: String
    var artist: String
    var album: String
    var duration: TimeInterval
    var filePath: String

    // iTunesDB-like metadata
    var trackNumber: Int?
    var playCount: Int
    var lastPlayed: Date?
    var fileSize: Int64?       // in bytes
    var bitRate: Int?          // kbps
    var sampleRate: Int?       // Hz

    init(title: String,
         artist: String,
         album: String,
         duration: TimeInterval,
         filePath: String,
         trackNumber: Int? = nil,
         playCount: Int = 0,
         lastPlayed: Date? = nil,
         fileSize: Int64? = nil,
         bitRate: Int? = nil,
         sampleRate: Int? = nil) {
        self.id = UUID()
        self.title = title
        self.artist = artist
        self.album = album
        self.duration = duration
        self.filePath = filePath
        self.trackNumber = trackNumber
        self.playCount = playCount
        self.lastPlayed = lastPlayed
        self.fileSize = fileSize
        self.bitRate = bitRate
        self.sampleRate = sampleRate
    }
}
