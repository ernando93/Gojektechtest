//
//  Extension.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIAlertController {
    
    static func defaultAlertController(title: String, message: String, textAction: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if textAction != "" {
            
            alert.addAction(UIAlertAction(title: textAction, style: .default, handler: nil))
        }
        
        return alert
    }
}

extension String {
    
    static func isValidEmail(emailString:String) -> Bool {
        
        if emailString == "" {
            
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: emailString)
    }
}

extension UITableView {
    
    public func setLoadingScreen(with spinner: UIActivityIndicatorView, loadingLabel: UILabel, viewController: UIViewController) {
        
        let loadingView = UIView()
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (self.frame.width / 2) - (width / 2)
        let y = (self.frame.height / 2) - (height / 2) - (viewController.navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        loadingLabel.isHidden = false
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        spinner.isHidden = false
        spinner.style = .gray
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.startAnimating()
        
        loadingView.addSubview(spinner)
        loadingView.addSubview(loadingLabel)
        
        self.addSubview(loadingView)
        
    }
    
    public func removeLoadingScreen(with spinner: UIActivityIndicatorView, loadingLabel: UILabel) {
        
        spinner.stopAnimating()
        spinner.isHidden = true
        loadingLabel.isHidden = true
        
    }
}
