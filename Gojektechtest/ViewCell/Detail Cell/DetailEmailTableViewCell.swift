//
//  DetailEmailTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class DetailEmailTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    func configureCell() {
        labelTitle.text = "email"
        labelEmail.text = "polly.rich@gmail.com"
    }

}
