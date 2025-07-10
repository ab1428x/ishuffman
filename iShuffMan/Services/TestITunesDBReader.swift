//
//  TestITunesDBReader.swift
//  iShuffMan
//
//  Created by Jay on 7/9/25.
//


import Foundation

struct TestITunesDBReader {
    static func run() {
        print("🔍 Attempting to load iTunesDB file...")

        guard let dbURL = Bundle.main.url(forResource: "iTunesDB", withExtension: nil) else {
            print("❌ Could not find iTunesDB in app bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: dbURL)
            print("✅ Loaded iTunesDB (\(data.count) bytes)")

            // For now, just print the first few bytes in hex
            let preview = data.prefix(64)
            print("🧪 Preview (first 64 bytes):")
            for (index, byte) in preview.enumerated() {
                print(String(format: "%02X ", byte), terminator: ((index + 1) % 16 == 0 ? "\n" : " "))
            }

            // TODO: Replace with real parsing logic using your Track model

        } catch {
            print("⚠️ Failed to load iTunesDB: \(error)")
        }
    }
}
