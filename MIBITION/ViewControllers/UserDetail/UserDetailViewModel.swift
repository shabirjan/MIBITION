//
//  UserDetailViewModel.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import RxSwift

class UserDetailViewModel {
    
    // MARK: - Outputs
    
    /// Emits user detail object
    let userDetail: Observable<UserDetail>
    
    /// Emits an error message
    let alertMessage: Observable<String>
    
    init(githubService: GitHubService = GitHubService(), userId: Int) {
    
        let _alertMessage = PublishSubject<String>()
        self.alertMessage = _alertMessage.asObservable()
        
        self.userDetail = githubService.getUserDetail(id: userId)
                .catchError { error in
                    _alertMessage.onNext(error.localizedDescription)
                    return Observable.empty()
                }
        .share()
    }
}
