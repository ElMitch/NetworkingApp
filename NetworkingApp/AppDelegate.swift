//
//  AppDelegate.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    private let versionsCoordinator = VersionsCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = versionsCoordinator.rootViewController
        window?.makeKeyAndVisible()

        versionsCoordinator.start()

        return true
    }

}
