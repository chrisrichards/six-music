//
//  HttpMethod.swift
//  sixmusic
//
//  Created by Chris Richards on 22/02/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Foundation

enum HttpMethod: Equatable {
    case get([URLQueryItem])
    case put(Data?)
    case post(Data?)
    case delete
    case head

    var name: String {
        switch self {
        case .get: return "GET"
        case .put: return "PUT"
        case .post: return "POST"
        case .delete: return "DELETE"
        case .head: return "HEAD"
        }
    }
}
