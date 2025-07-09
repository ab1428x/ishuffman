//
//  Track.swift
//  iShuffMan
//
//  Created by Jay on 7/9/25.
//


import Foundation

struct Track: Identifiable {
    let id = UUID()
    var title: String
    var artist: String
    var album: String
    var duration: TimeInterval
    var filePath: String
}
