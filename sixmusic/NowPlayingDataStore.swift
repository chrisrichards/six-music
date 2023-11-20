//
//  NowPlayingDataStore.swift
//  sixmusic
//
//  Created by Chris Richards on 23/02/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Combine
import Foundation

struct NowPlaying: Equatable {
    let artist: String
    let track: String
    let imageUrl: URL!
    
    static func == (lhs: NowPlaying, rhs: NowPlaying) -> Bool {
        return lhs.artist == rhs.artist &&
            lhs.track == rhs.track &&
            lhs.imageUrl == rhs.imageUrl
    }
}

final class NowPlayingDataStore: ObservableObject {
    private var cancellables: [AnyCancellable] = []

    @Published var nowPlaying: NowPlaying = NowPlaying(artist: "Artist", track: "Track", imageUrl: URL(string: "https://ichef.bbci.co.uk/images/ic/320x320/p0965lxf.jpg"))

    init() {
        refreshNowPlaying()
        
        Timer.publish(every: 30, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                self.refreshNowPlaying()
            }
            .store(in: &cancellables)
    }
    
    @objc func refreshNowPlaying() {
        let request: Request<SegmentItemsResponse> = .latest()
        URLSession.shared.publisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .replaceError(with: [])
            .prefix(1)
            .filter { segments in
                return segments.count > 0
            }
            .map { segments in
                let segment = segments.first!
                let imageUrl = segment.image_url.replacingOccurrences(of: "{recipe}", with: "320x320")
                return NowPlaying(artist: segment.titles.primary, track: segment.titles.secondary, imageUrl: URL(string: imageUrl))
            }
            .filter { newNowPlaying in
                return newNowPlaying != self.nowPlaying
            }
            .assign(to: \.nowPlaying, on: self)
            .store(in: &cancellables)
    }
}

