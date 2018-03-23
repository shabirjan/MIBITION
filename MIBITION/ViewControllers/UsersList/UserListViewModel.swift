//
//  UserListViewModel.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import Foundation
import RxSwift

class UserListViewModel {
    
    // MARK: - Inputs
    
    /// Call to open selected User
    let selectUser: AnyObserver<UserViewModel>
    
    /// Call to reload Users
    let reload: AnyObserver<Void>
    
    // MARK: - Outputs
    
    /// Emits an array of fetched Users
    let users: Observable<[UserViewModel]>
    
    /// Emits an error message
    let alertMessage: Observable<String>
    
    /// Emits ID of the User to be shown
    let showUser: Observable<Int>
    
    init(githubService: GitHubService = GitHubService()) {
        
        let _reload = BehaviorSubject<Void>(value: ())
        self.reload = _reload.asObserver()
        
        let _alertMessage = PublishSubject<String>()
        self.alertMessage = _alertMessage.asObservable()
        
        self.users = _reload.flatMapLatest {
            githubService.getUsers()
                .catchError { error in
                    _alertMessage.onNext(error.localizedDescription)
                    return Observable.empty()
                }
                .map { users in users.map(UserViewModel.init)}
        }        
        let _selectUser = PublishSubject<UserViewModel>()
        self.selectUser = _selectUser.asObserver()
        self.showUser = _selectUser.asObservable()
            .map { $0.id } 
    }
}
