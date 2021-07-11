//
//  ConfigurationEndPoint.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//

import Foundation

enum ManagersSpecialEndPoint: EndPoint {
    case products
    
    var baseUrl: String {
        return "https://raw.githubusercontent.com/"
    }
    
    var path: String {
        switch self {
        case .products:
            return "Swiftly-Systems/code-exercise-ios/master/backup"
        }
    }
}
