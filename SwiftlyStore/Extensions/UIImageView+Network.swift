//
//  UIImageView+Network.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/10/2021.
//

import UIKit

extension UIImageView {
    func load(url: URL?, placeholderImage: UIImage, completionHandler: @escaping ((UIImage)->Void), errorHandler: @escaping ((Error?)->Void)) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data else {
                    errorHandler(error)
                    DispatchQueue.main.async {
                        self?.image = placeholderImage
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        completionHandler(image)
                        self?.image = image
                    }
                    else {
                        self?.image = placeholderImage
                        errorHandler(NetworkError.noImage)
                    }
                }
            }.resume()
        }
        else {
            errorHandler(NetworkError.invalidUrl)
            self.image = placeholderImage
        }
            
    }
}
