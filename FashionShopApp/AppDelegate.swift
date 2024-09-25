//
//  AppDelegate.swift
//  FashionShopApp
//
//  Created by Alena on 24.09.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let onboardingModule = OnboardingRouter.createModule()
        let navigationController = UINavigationController(rootViewController: onboardingModule)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

