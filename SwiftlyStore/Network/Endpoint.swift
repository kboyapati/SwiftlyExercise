//
//  Endpoint.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//


import Foundation

public typealias Parameters = [String: Any]

protocol EndPoint {
    var baseUrl: String { get }
    var path: String { get }
    var parameters: Parameters { get }
    var request: URLRequest? { get }
}

extension EndPoint {
    var path: String {
        return ""
    }
    
    var parameters: Parameters {
        Parameters()
    }
    
    var request: URLRequest? {
        var components = URLComponents(string: baseUrl + path)
        components?.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: ($0.value as? String) ?? "") })
        if let queryUrl = components?.url {
            return URLRequest(url: queryUrl)
        }
        return nil
    }
}
