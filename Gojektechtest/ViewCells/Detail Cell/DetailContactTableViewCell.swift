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
    
    func configureCell(with data: Contact, row: Int) {
        
        setupContentInRow(row: row, data: data)
    }
    
    func setupContentInRow(row: Int, data: Contact) {
        
        switch row {
            
        case 1:
            labelTitle.text = "Mobile"
            labelValue.text = data.phoneNumber
        case 2:
            labelTitle.text = "Email"
            labelValue.text = data.email
        default:
            print("Default")
        }
    }
}
