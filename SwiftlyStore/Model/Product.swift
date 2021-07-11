//
//  ManagerSpecial.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//

import Foundation

class Product: Codable {
    var displayName: String?
    var height: Int?
    var imageURL: String?
    var originalPrice, price: String?
    var width: Int?

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case height
        case imageURL = "imageUrl"
        case originalPrice = "original_price"
        case price, width
    }

    init(displayName: String?, height: Int?, imageURL: String?, originalPrice: String?, price: String?, width: Int?) {
        self.displayName = displayName
        self.height = height
        self.imageURL = imageURL
        self.originalPrice = originalPrice
        self.price = price
        self.width = width
    }
}
