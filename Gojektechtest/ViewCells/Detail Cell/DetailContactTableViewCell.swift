//
//  DetailContactTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class DetailContactTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    func configureCell(with row: Int) {
        
        setupContentInRow(row: row)
    }
    
    func setupContentInRow(row: Int) {
        
        switch row {
            
        case 1:
            labelTitle.text = "Mobile"
            labelValue.text = "+917868765643"
        case 2:
            labelTitle.text = "Email"
            labelValue.text = "polly.rich@gmail.com"
        default:
            print("Default")
        }
    }
}
