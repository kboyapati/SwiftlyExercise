//
//  ViewController.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//

import UIKit
import Combine

class ProductsViewController: UIViewController {

    var viewModel: ProductsViewModel?
    var dataSource: UICollectionViewDiffableDataSource<Section, ProductViewModel>!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.fetchData()
    }
    
    func initializeViewModel() {
        self.viewModel = ProductsViewModel(viewWidth: self.collectionView.bounds.size.width)
        self.viewModel?.refreshHandler = { [weak self] products in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let viewModel = self.viewModel, let product = viewModel.productViewModelAt(index: indexPath.item) {
            //            let multiplier = (self.collectionView.bounds.size.width - 16) / CGFloat(self.viewModel?.canvasUnit ?? 1)
            return CGSize(width: product.width, height: product.height)
        }
        else {
            return .zero
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.productViewModel = self.viewModel?.productViewModelAt(index: indexPath.item)
        return cell
    }
}

