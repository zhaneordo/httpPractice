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
    
    private let encode: () throws -> Data
    
    public init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self.encode = { try encoder.encode(value) }
    }
    
    public func encode() throws -> Data {
        return try encode()
    }
}
