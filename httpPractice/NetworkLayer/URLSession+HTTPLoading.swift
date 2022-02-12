//
//  URLSession+HTTPLoading.swift
//  httpPractice
//
//  Created by Zhaneordo on 2/6/22.
//

import Foundation

extension URLSession: HTTPLoading {

    public func load(request: HTTPRequest, completion: @escaping (HTTPResult) -> Void) {
        guard let url = request.url else {
            // we couldn't construct a proper URL out of the request's URLComponents
            completion(.failure(HTTPError.init(code: .invalidRequest, request: request, response: nil, underlyingError: nil)))
            return
        }
    
        // construct the URLRequest
        var urlRequest = URLRequest(url: url)
        
        // copy over any custom HTTP headers
        for (header, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: header)
        }
        
        if request.body.isEmpty == false {
            // if our body defines additional headers, add them
            for (header, value) in request.body.additionalHeaders {
                urlRequest.addValue(value, forHTTPHeaderField: header)
            }
            
            // attempt to retrieve the body data
            do {
                urlRequest.httpBody = try request.body.encode()
            } catch {
                // something went wrong creating the body; stop and report back
                completion(.failure(HTTPError.init(code: .invalidRequest, request: request, response: nil, underlyingError: nil)))
                return
            }
        }
        
        let dataTask = session.dataTask(with: URLRequest) { (data, response, error) in
            // construct a Result<HTTPResponse, HTTPError> out of the triplet of data, url response, and url error
            var httpReponse: HTTPResponse?
            if let r = response as? HTTPURLResponse {
                httpReponse = HTTPResponse(request: request, response: r, body: data ?? Data())
            }
            
            if let e = error as? URLError {
                let code: HTTPError.Code
                switch e.code {
                    case .badURL: code = .invalidRequest
                    default: code = .unknown
                }
                
                self = .failure(HTTPError(code: code, request: request, response: httpReponse, underlyingError: e))
            } else if let someError = error {
                // an error, but not a URL error
                self = .failure(HTTPError(code: .unknown, request: request, response: httpReponse, underlyingError: someError))
            } else if let r = httpReponse {
                // not an error and an HTTPURLResponse
                self = .success(r)
            } else {
                // not an error, but also no an HTTPURLResponse
                self = .failure(HTTPError(code: .invalidResponse, request: request, response: nil, underlyingError: error))
            }
        }
        
        // off we go!
        dataTask.resume()
    }
}
