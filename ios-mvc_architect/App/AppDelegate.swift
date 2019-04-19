//
//  AppDelegate.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/18/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        let vc = MainViewController.instantiate()
        nav.viewControllers.append(vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

