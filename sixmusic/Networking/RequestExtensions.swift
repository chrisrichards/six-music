//
//  RequestExtensions.swift
//  sixmusic
//
//  Created by Chris Richards on 22/02/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Foundation

extension Request {
    var urlRequest: URLRequest {
        var request = URLRequest(url: url)

        switch method {
        case .post(let data), .put(let data):
            request.httpBody = data
        case let .get(queryItems):
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                preconditionFailure("Couldn't create a url from components...")
            }
            request = URLRequest(url: url)
        default:
            break
        }

        request.allHTTPHeaderFields = headers
        request.httpMethod = method.name
        return request
    }
}
