//
//  UserListCoordinator.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit
import RxSwift

class UserListCoordinator: BaseCoordinator<Void> {
    private let parent: UINavigationController
    
    init(parent: UINavigationController) {
        self.parent = parent
    }
    
    override func start() -> Observable<Void>  {
        let viewModel = UserListViewModel()
        let viewController = UsersListViewController.initFromStoryboard(name: "Main")
        
        viewController.viewModel = viewModel
        
        viewModel.showUser
            .subscribe(onNext: { [weak self] in self?.showUserDetail(by: $0) })
            .disposed(by: disposeBag)
        parent.pushViewController(viewController, animated: true)
        return Observable.never()
    }
    
    private func showUserDetail(by id: Int)  {
        let userDetailCoordinator = UserDetailCoordinator(navigationController: parent, userId: id)
         coordinate(to: userDetailCoordinator)
    }
}
