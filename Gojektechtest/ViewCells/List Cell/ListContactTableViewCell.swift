//
//  ListContactTableViewCell.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit
import SDWebImage

class ListContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageFavourite: UIImageView!
    
    func configureCell(with data: Contact) {
        labelName.text = data.firstName + " " + data.lastName
        imageProfile.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageProfile.sd_setImage(with: URL(string: data.profilePic), placeholderImage: UIImage(named: "placeholder_photo"))
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        imageFavourite.isHidden = data.favorite == false ? true : false
    }
}
