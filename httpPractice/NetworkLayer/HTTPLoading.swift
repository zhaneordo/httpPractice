//
//  HTTPLoading.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/6/22.
//

import Foundation

public protocol HTTPLoading {
    func load(request: HTTPRequest, completion: @escaping (HTTPResult) -> Void)
}
