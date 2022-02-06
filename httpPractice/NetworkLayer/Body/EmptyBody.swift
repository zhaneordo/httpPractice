//
//  EmptyBody.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/6/22.
//

import Foundation

public struct EmptyBody: HTTPBody {
    public let isEmpty = true
    
    public init() {}
    public func encode() throws -> Data {
        Data()
    }
}
