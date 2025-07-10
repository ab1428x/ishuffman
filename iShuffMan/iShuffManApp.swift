//
//  iShuffManApp.swift
//  iShuffMan
//
//  Created by Jay on 7/9/25.
//

import SwiftUI

@main
struct iShuffManApp: App {
    init() {
        TestITunesDBReader.run()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
