//
//  ProductCell.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/06/2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet var lblProductName: UILabel!
    @IBOutlet var lblDiscountedPrice: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var containerView: UIView!
    var productViewModel: ProductViewModel? {
        didSet {
            configure()
        }
    }

    private func configure() {
        guard let viewModel = productViewModel else { return }
        lblProductName.font = UIFont.systemFont(ofSize: viewModel.fontSize)
        lblDiscountedPrice.font = UIFont.systemFont(ofSize: viewModel.fontSize)
        lblPrice.font = UIFont.systemFont(ofSize: viewModel.fontSize)
        lblProductName.text = viewModel.productName
        lblDiscountedPrice.attributedText = viewModel.origionalPrice
        lblPrice.text = viewModel.price
        
        self.imageView.load(url: viewModel.url, placeholderImage: #imageLiteral(resourceName: "J")) { image in
            // we can do caching of images here
        } errorHandler: { _ in
            // log error on Firebase or any other server
        }
    }
}
