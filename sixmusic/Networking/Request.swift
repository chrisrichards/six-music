//
//  Request.swift
//  sixmusic
//
//  Created by Chris Richards on 22/02/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Foundation

struct Request<Response> {
    let url: URL
    let method: HttpMethod
    var headers: [String: String] = [:]
}
