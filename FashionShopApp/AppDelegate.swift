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
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let onboardingViewController = OnboardingRouter.createModule()
                
        window?.rootViewController = UINavigationController(rootViewController: onboardingViewController)
        
        window?.makeKeyAndVisible()

        return true
    }
}

