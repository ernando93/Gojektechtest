//
//  DetailHeaderTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class DetailHeaderTableViewCell: UITableViewCell {
    
    var gradientLayer: CAGradientLayer!

    func configureCell() {
        let greenColor = UIColor(red: 216.0/255.0, green: 245.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        setGradientBackground(colorTop: .white, colorBottom: greenColor)
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
