//
//  HTTPResult.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/5/22.
//

import Foundation

public typealias HTTPResult = Result<HTTPResponse, HTTPError>

public struct HTTPError: Error {
    /// the high-level classification of this erro
    public let code: Code
    
    /// the HTTPRequest that resulted in this error
    public let request: HTTPRequest
    
    /// any HTTPResponse (partial or otherwise) that we might have
    public let response: HTTPResponse?
    
    /// if we have more information about the error that caused this, stash it here
    public let underlyingError: Error?
    
    public enum Code {
        case invalidRequest         // the HTTPRequest could not be turned into a URLRequest
        case cannotConnect          // some sort of connectivity problem
        case cancelled              // the user cancelled the request
        case insecureConnection     // couldn't establish a secure connection to the server
        case invalidResponse        // the sustem did not receive a valid HTTP response
                                    // other scenarios we may wish to expose; fill in as necessary
        case unknown                // we have no idea what the problem is
    }
}

extension HTTPResult {
    
    public var request: HTTPRequest {
        switch self {
            case .success(let response): return response.request
            case .failure(let error): return error.request
        }
    }
    
    public var response: HTTPResponse? {
        switch self {
            case .success(let response): return response
            case .failure(let error): return error.response
        }
    }
}
