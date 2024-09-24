//
//  OnboardingRouter.swift
//  FashionShopApp
//
//  Created by Alena on 24.09.2024.
//

import UIKit

protocol OnboardingRouterInput {
    static func createModule() -> UIViewController
//    func navigateToRegister(from view: UIViewController)
}

class OnboardingRouter: OnboardingRouterInput {
    
    // Создание модуля Onboarding с кодом, без использования сторибордов
    static func createModule() -> UIViewController {
        // Инициализация ViewController вручную
        let view = OnboardingViewController()
        
        // Создание VIPER компонентов
        let presenter = OnboardingPresenter()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
        
        // Установка зависимостей
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
//    func navigateToRegister(from view: UIViewController) {
//        let registerViewController = RegisterRouter.createModule()
//        view.navigationController?.pushViewController(registerViewController, animated: true)
//       }
}
