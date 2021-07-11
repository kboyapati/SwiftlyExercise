//
//  ProductViewModel.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//

import UIKit

class ProductViewModel {
    
    private var product: Product
    private var multiplier: CGFloat
    
    init(product: Product, multiplier: CGFloat) {
        self.product = product
        self.multiplier = multiplier
    }
    
    var productName: String {
        self.product.displayName ?? ""
    }
    
    var price: String {
        self.product.price ?? ""
    }
    
    var fontSize: CGFloat {
        width < 100 ? 12 : 17
    }
    
    var origionalPrice: NSAttributedString {
        NSAttributedString(string: self.product.originalPrice ?? "", attributes: [NSAttributedString.Key.strikethroughStyle : 2, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    }
    
    var productWidth: CGFloat {
        CGFloat(self.product.width ?? 1)
    }
    
    var productHeight: CGFloat {
        CGFloat(self.product.height ?? 1)
    }
    
    var width: CGFloat {
        CGFloat(self.product.width ?? 1) * multiplier
    }
    
    var height: CGFloat {
        CGFloat(self.product.height ?? 1) * multiplier
    }
    
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
    
    var url: String {
        return self.product.imageURL ?? ""
    }
}

extension ProductViewModel: Hashable {
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        return lhs.price == rhs.price && lhs.origionalPrice == rhs.origionalPrice && lhs.productName == rhs.productName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.productName)
        hasher.combine(self.price)
        hasher.combine(self.origionalPrice)
    }
}
