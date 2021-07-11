//
//  DesignView.swift
//  ShadowView
//
//  Created by Naga Kokila Boyapati on 24/07/2020.
//

import UIKit


@IBDesignable class DesignView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var shadowOffsetWidth: CGFloat = 0.0
    @IBInspectable var shadowOffsetHeight: CGFloat = 0.0
    @IBInspectable var shadowOpacity: CGFloat = 0.5
    @IBInspectable var shadowColor: UIColor = .systemGray5
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.shadowColor = self.shadowColor.cgColor;
        self.layer.shadowOffset = CGSize(width: self.shadowOffsetWidth, height: self.shadowOffsetHeight)
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius)
        self.layer.shadowPath = path.cgPath;
        self.layer.shadowOpacity = Float(self.shadowOpacity);
    }
}
