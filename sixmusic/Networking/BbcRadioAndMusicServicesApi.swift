//
//  NowPlayingApi.swift
//  sixmusic
//
//  Created by Chris Richards on 22/02/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Foundation


struct CommercialLinks: Decodable {
    let type: String
    let id: String
    let label: String
    let uri: String
}

struct SegmentTitles: Decodable {
    let primary: String
    let secondary: String
    let tertiary: String!
}

struct SegmentOffset:  Decodable {
    let start: Int
    let end: Int
    let label: String
    let now_playing: Bool
}

struct Segment: Decodable {
    let type: String
    let id: String
    let urn: String
    let segment_type: String
    let titles: SegmentTitles
    let synopses: String!
    let image_url: String!
    let offset: SegmentOffset
    let uris: [CommercialLinks]!
}

struct SegmentItemsResponse: Decodable {
    let total: Int
    let limit: Int
    let offset: Int
    let data: [Segment]
}

extension Request where Response == SegmentItemsResponse {
    static func latest() -> Self {
        Request(
            url: URL(string: "https://rms.api.bbc.co.uk/v2/services/bbc_6music/segments/latest")!,
            method: .get([])
        )
    }
}
