//
//  UserDetail.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import Foundation

struct UserDetail: Codable {
    let _name: String?
    let _userLocation: String?
    let _company: String?
    let userImage: String
    let _userEmail: String?
    let _userBio: String?
    
    let publicRepos: Int
    let publicGists: Int
    let userFollowers: Int
    let userFollowing: Int
    
    private enum CodingKeys: String, CodingKey {
        case _name = "name"
        case _userLocation = "location"
        case _company = "company"
        case userImage = "avatar_url"
        case _userEmail = "email"
        case _userBio = "bio"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case userFollowers = "followers"
        case userFollowing = "following"
    }
    
}
