//
//  HTTPMethod.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/5/22.
//

import Foundation

public struct HTTPMethod: Hashable {
    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")
    public static let delete = HTTPMethod(rawValue: "DELETE")
    
    public let rawValue: String
}
