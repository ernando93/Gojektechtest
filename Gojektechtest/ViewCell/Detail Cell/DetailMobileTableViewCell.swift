//
//  DetailMobileTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class DetailMobileTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMobile: UILabel!
    
    func configureCell() {
        labelTitle.text = "mobile"
        labelMobile.text = "+917868765643"
    }

}
