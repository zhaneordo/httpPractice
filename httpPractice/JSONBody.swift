//
//  JSONBody.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/6/22.
//

import Foundation

public struct JSONBody: HTTPBody {
    public let isEmpty: Bool = false
    public var additionalHeaders = [
        "Content-Type": "application/json; charset=utf-8"
    ]

    private let _encode: () throws -> Data // what does "_" before encode do?
    // found here: https://github.com/andrija-ostojic/Swift-Network-Layer/blob/aac2a7b7c7dd0dd023c645eb3b029efc1f569e4c/Network%20Layer%20Example/Network%20Layer%20Example/NetworkLayer/Body/JSONBody.swift#L17

    public init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self._encode = { try encoder.encode(value) }
    }

    public func encode() throws -> Data {
        return try _encode()
    }
}
