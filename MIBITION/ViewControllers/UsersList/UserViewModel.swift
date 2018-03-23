//
//  UserViewModel.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import Foundation

class UserViewModel {
    let name: String
    let id: Int
    let imageUrl: String
    let type: String
    
    init(user: User) {
        self.name = user.userName
        self.id = user.userId
        self.type = user.userType
        self.imageUrl = user.userAvatar
    }
}
