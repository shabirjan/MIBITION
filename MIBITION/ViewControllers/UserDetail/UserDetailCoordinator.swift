//
//  UserDetailCoordinator.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import RxSwift

class UserDetailCoordinator: BaseCoordinator<Void> {
    
    private let navigationController: UINavigationController
    private let userId: Int
    init(navigationController: UINavigationController, userId: Int) {
        
        self.navigationController = navigationController;
        self.userId = userId
    }
    
    override func start() {
        let viewController = UserDetailViewController.initFromStoryboard(name: "Main")
        let viewModel = UserDetailViewModel(userId: userId)
        viewController.viewModel = viewModel
       navigationController.pushViewController(viewController, animated: true)
    }
}
