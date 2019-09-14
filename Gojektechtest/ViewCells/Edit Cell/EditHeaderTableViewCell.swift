//
//  EditHeaderTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class EditHeaderTableViewCell: UITableViewCell {

    func configureCell() {
        
        let greenColor = UIColor(red: 216.0/255.0, green: 245.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.contentView.setGradientBackground(colorTop: .white, colorBottom: greenColor)
    }
}
