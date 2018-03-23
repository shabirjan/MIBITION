//
//  AppCoordinator.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/13/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator : BaseCoordinator<Void> {
    
    private let root: UINavigationController
    
    init(root: UINavigationController) {
        self.root = root
    }
    
    override func start()  {
        let userListCoordinator = UserListCoordinator(parent: root)
         coordinate(to: userListCoordinator)
    }
}
