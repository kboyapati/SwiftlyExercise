//
//  Products.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//

import Foundation

class ManagerSpecial: Codable {
    var canvasUnit: Int?
    var managerSpecials: [Product]?

    init(canvasUnit: Int?, managerSpecials: [Product]?) {
        self.canvasUnit = canvasUnit
        self.managerSpecials = managerSpecials
    }
}
