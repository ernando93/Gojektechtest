//
//  EditHeaderTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit
import SDWebImage

class EditHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    
    func configureCell(with data: Contact) {
        
        let greenColor = UIColor(red: 216.0/255.0, green: 245.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.contentView.setGradientBackground(colorTop: .white, colorBottom: greenColor)
        imageProfile.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageProfile.sd_setImage(with: URL(string: data.profilePic), placeholderImage: UIImage(named: "placeholder_photo"))
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
    }
}
