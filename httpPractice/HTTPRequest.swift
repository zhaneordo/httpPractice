//
//  HTTPRequest.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/5/22.
//

import Foundation

public struct HTTPRequest {
    private var urlComponents = URLComponents()
    public var method: HTTPMethod = .get // as defined on HTTPMethod
    public var headers: [String: String] = [:]
    public var body: HTTPBody = EmptyBody()
    
    public init() {
        urlComponents.scheme = "https"
    }
}

public extension HTTPRequest {
    var scheme: String { urlComponents.scheme ?? "https" }
    
    var host: String? {
        get { urlComponents.host }
        set { urlComponents.host = newValue }
    }
    
    var path: String {
        get { urlComponents.path }
        set { urlComponents.path = newValue }
    }
}
