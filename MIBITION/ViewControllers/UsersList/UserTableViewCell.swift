//
//  UserTableViewCell.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let Identifier = "UserCell"
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UILabel!
    
    func configureWithUser(user: UserViewModel){
        userName.text = user.name
        userType.text = user.type
        userImage.download(imageUrl: user.imageUrl)
    }
}
