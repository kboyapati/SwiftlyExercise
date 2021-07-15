//
//  ProductsViewModel.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/05/2021.
//

import UIKit
import Combine

enum Section {
    case products
}

class ProductsViewModel {
    
    var viewWidth: CGFloat
    private var managerSpecial: ManagerSpecial?
    private var products: [ProductViewModel]?
    var refreshHandler: (([ProductViewModel])->Void)?
    var errorHandler: ((Error?)->Void)?
    
    var canvasUnit: Int {
        if self.managerSpecial?.canvasUnit != nil {
            return self.managerSpecial!.canvasUnit!
        }
        else {
            return 1
        }
    }
    
    var items: Int {
        return self.products?.count ?? 0
    }
    
    init(viewWidth: CGFloat) {
        self.viewWidth = viewWidth
    }
    
    func productViewModelAt(index: Int) -> ProductViewModel? {
        if index < (self.products?.count ?? 0) {
            return self.products?[index]
        }
        return nil
    }
    
    func fetchData() {
        Network.request(endPoint: ManagersSpecialEndPoint.products) { [weak self] (result: Result<ManagerSpecial, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let info):
                self.managerSpecial = info
                let multiplier = self.viewWidth / CGFloat(info.canvasUnit ?? 1)
                self.products = info.managerSpecials?.compactMap({ ProductViewModel(product: $0, multiplier: multiplier) })
                self.refreshHandler?(self.products ?? [ProductViewModel]())
            case .failure(let error):
                self.errorHandler?(error)
            }
        }
    }
}
