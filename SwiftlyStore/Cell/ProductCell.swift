//
//  ProductCell.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/06/2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
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
        if let url = URL(string: productViewModel?.url ?? "") {
            self.imageView.load(url: url)
        }
    }
}
