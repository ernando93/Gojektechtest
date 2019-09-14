//
//  EditContactTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class EditContactTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    func configureCell(with row: Int) {
        setupContentInRow(row: row)
    }
    
    func setupContentInRow(row: Int) {
        if row == 1 {
            labelTitle.text = "First Name"
            textField.keyboardType = .default
            textField.text = "Polly"
        } else if row == 2 {
            labelTitle.text = "Last Name"
            textField.keyboardType = .default
            textField.text = "Richardson"
        } else if row == 3 {
            labelTitle.text = "Mobile"
            textField.keyboardType = .numberPad
            textField.text = "+917868765643"
        } else {
            labelTitle.text = "Email"
            textField.keyboardType = .emailAddress
            textField.text = "polly.rich@gmail.com"
        }
    }
}
