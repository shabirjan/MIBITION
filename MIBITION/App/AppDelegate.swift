//
//  AppDelegate.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/13/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit
import RxSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    private let disboseBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        let nav = UINavigationController()
        window?.rootViewController = nav
        appCoordinator = AppCoordinator(root: nav)
        appCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
}

