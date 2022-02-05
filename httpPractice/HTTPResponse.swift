//
//  HTTPResponse.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/5/22.
//

import Foundation

public struct HTTPResponse {
    public let request: HTTPRequest
    private let response: HTTPURLResponse
    public let body: Data?
    
    public var status: HTTPStatus {
        // a struct similar construction to HTTPMethod
        HTTPStatus(rawValue: response.statusCode)
    }
    
    public var message: String {
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }
    
    public var headers: [AnyHashable: Any] {
        response.allHeaderFields
    }
}
