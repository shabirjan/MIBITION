//
//  UserTests.swift
//  MIBITIONTests
//
//  Created by Shabir Jan on 3/15/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import XCTest
@testable import MIBITION

class UserTests: XCTestCase {
    
    private let sampleJSON: [String: Any] = [
        "login": "login",
        "type": "type",
        "id": 1,
        "avatar_url": "url"
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func test_InitFromJSON_AllFieldsAreCorrect() {
        
        let data = try? JSONSerialization.data(withJSONObject: sampleJSON, options: .prettyPrinted)
        let decoder = JSONDecoder()
        guard let user  = try? decoder.decode(User.self, from: data!) else {
            return XCTFail()
        }
        XCTAssertEqual(user.userName, "login")
        XCTAssertEqual(user.userType, "type")
        XCTAssertEqual(user.userId, 1)
        XCTAssertEqual(user.userAvatar, "url")
    }
}
