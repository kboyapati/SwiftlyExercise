//
//  UIImageView+Network.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/10/2021.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}
