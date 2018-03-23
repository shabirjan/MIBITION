//
//  UserViewModelTests.swift
//  MIBITIONTests
//
//  Created by Shabir Jan on 3/15/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import XCTest
@testable import MIBITION

class UserViewModelTests: XCTestCase {
    let user = User(userName: "UserName", userId: 1, userAvatar: "Correct URL", userType: "UserType")
    
    var userViewModel: UserViewModel!
    override func setUp() {
        
        super.setUp()
        userViewModel = UserViewModel(user: user)
    }
    
    func test_Name_ReturnsUserName() {
        XCTAssertEqual(userViewModel.name, "UserName")
    }
    
    func test_UserType_ReturnsUserType() {
        XCTAssertEqual(userViewModel.type, "UserType")
    }
    
    func test_UserId_ReturnsUserId() {
        XCTAssertEqual(userViewModel.id, 1)
    }
    
    func test_URL_ReturnsAvatarURL() {
        XCTAssertEqual(userViewModel.imageUrl, "Correct URL")
    }
}
