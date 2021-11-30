//
//  URLSessionExtensions.swift
//  sixmusic
//
//  Created by Chris Richards on 22/02/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Combine
import Foundation

enum APIError: Error {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
}

extension URLSession {
    enum Error: Swift.Error {
        case networking(URLError)
        case decoding(Swift.Error)
    }

    func publisher(
        for request: Request<Data>
    ) -> AnyPublisher<Data, Swift.Error> {
        dataTaskPublisher(for: request.urlRequest)
            .mapError(Error.networking)
            .map(\.data)
            .eraseToAnyPublisher()
    }

    func publisher(
        for request: Request<URLResponse>
    ) -> AnyPublisher<URLResponse, Swift.Error> {
        dataTaskPublisher(for: request.urlRequest)
            .mapError(Error.networking)
            .map(\.response)
            .eraseToAnyPublisher()
    }

    func publisher<Value: Decodable>(
        for request: Request<Value>,
        using decoder: JSONDecoder = .init()
    ) -> AnyPublisher<Value, Swift.Error> {
        dataTaskPublisher(for: request.urlRequest)
            .mapError(Error.networking)
            .map(\.data)
            .decode(type: Value.self, decoder: decoder)
            .catch { error -> AnyPublisher<Value, Swift.Error> in
                print("Decoding failed with error: \(error)")
                return Empty(completeImmediately: true)
                    .eraseToAnyPublisher()
             }
            .mapError(Error.decoding)
            .eraseToAnyPublisher()
    }
}
