//
//  UIViewController+Alert.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/13/2021.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, actions: UIAlertAction...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach({ alert.addAction($0) })
        self.present(alert, animated: true, completion: nil)
    }
}
