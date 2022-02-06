//
//  HTTPBody.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/6/22.
//

import Foundation

public protocol HTTPBody {
    var isEmpty: Bool { get }
    var additionalHeaders: [String: String] { get }
    func encode() throws -> Data
}

extension HTTPBody {
    public var isEmpty: Bool { return false }
    public var additionalHeaders: [String: String] { return [:] }
}

