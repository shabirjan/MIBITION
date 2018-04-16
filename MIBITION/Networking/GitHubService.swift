//
//  GitHubService.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/13/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import Foundation
import RxSwift


enum GitHubServiceError: Error {
    case cannotParse
}

class GitHubService {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /// - Returns: A list of github users
    func getUsers() -> Observable<[User]> {
        let request = URLRequest(url: URL(string: "https://api.github.com/users")!)
        
        return session.rx
            .data(request: request)
            .map{ data throws -> [User] in
                let decoder = JSONDecoder()
                return try decoder.decode([User].self, from: data)
        }
    }
    
    /// - Returns:  Details of selected User
    func getUserDetail(id: Int) -> Observable<UserDetail> {
        let request = URLRequest(url: URL(string: "https://api.github.com/users/\(id)")!)
        
        return session.rx
        .data(request: request)
            .map{ data throws -> UserDetail in
                let decoder = JSONDecoder()
                return try decoder.decode(UserDetail.self, from: data)
        }
    }
}
