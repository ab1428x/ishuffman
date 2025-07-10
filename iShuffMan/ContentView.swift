//
//  ContentView.swift
//  iShuffMan
//
//  Created by Jay on 7/9/25.
//

import SwiftUI

struct iPodTrack: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let duration: String
}

struct ContentView: View {
    @State private var tracks: [iPodTrack] = [
        iPodTrack(title: "Song 1", artist: "Artist A", duration: "3:42"),
        iPodTrack(title: "Song 2", artist: "Artist B", duration: "4:12"),
        iPodTrack(title: "Song 3", artist: "Artist C", duration: "2:58")
    ]
    @State private var selectedTrack: iPodTrack.ID?

    var body: some View {
        VStack(spacing: 0) {
            // Centered progress panel
            HStack {
                Spacer()
                ProgressPanel()
                Spacer()
            }

            Divider()

            // Main table view with context menu
            Table(tracks, selection: $selectedTrack) {
                TableColumn("Title") { track in
                    Text(track.title)
                        .contextMenu {
                            Button("Delete") {
                                if let index = tracks.firstIndex(where: { $0.id == track.id }) {
                                    tracks.remove(at: index)
                                }
                            }
                        }
                }
                TableColumn("Artist") { track in
                    Text(track.artist)
                        .contextMenu {
                            Button("Delete") {
                                if let index = tracks.firstIndex(where: { $0.id == track.id }) {
                                    tracks.remove(at: index)
                                }
                            }
                        }
                }
                TableColumn("Duration") { track in
                    Text(track.duration)
                        .contextMenu {
                            Button("Delete") {
                                if let index = tracks.firstIndex(where: { $0.id == track.id }) {
                                    tracks.remove(at: index)
                                }
                            }
                        }
                }
            }
            .frame(minHeight: 300)
            .onDeleteCommand {
                if let selected = selectedTrack,
                   let index = tracks.firstIndex(where: { $0.id == selected }) {
                    tracks.remove(at: index)
                }
            }

            Divider()

            // Bottom bar with Sync button aligned right
            HStack {
                HStack {
                    Text("\(tracks.count) songs • 1.2 GB free of 2 GB total")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .center)

                Button("Sync") {
                    // Sync action
                }
            }
            .padding(.vertical, 8)
        }
        .padding([.leading, .trailing, .bottom])
        .frame(minWidth: 600, minHeight: 400)
    }
}

private struct ProgressPanel: View {
    var body: some View {
        VStack {
            ProgressView("Reading iTunesDB...")
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(NSColor.windowBackgroundColor).opacity(0.9))
        )
        .padding(.vertical, 6)
        .frame(maxWidth: 300)
    }
}

#Preview {
    ContentView()
}
