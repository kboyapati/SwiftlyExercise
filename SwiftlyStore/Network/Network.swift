//
//  Network.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//


import UIKit

class Network {
    class func request<T: Codable>(endPoint: EndPoint, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        if let request = endPoint.request {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let decodedInfo = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(decodedInfo))
                    }
                    catch {
                        completionHandler(.failure(error))
                    }
                    
                }
                else {
                    completionHandler(.failure(error!))
                }
            }
            .resume()
        }
    }
}
