//
//  GetStartedRouter.swift
//  FashionShopApp
//
//  Created by Alena on 25.09.2024.
//

import UIKit

protocol GetStartedRouterInput {
    static func createModule() -> UIViewController
//    func navigateToRegister(from view: UIViewController)
}

class GetStartedRouter: GetStartedRouterInput {
    
    // Создание модуля Onboarding с кодом, без использования сторибордов
    static func createModule() -> UIViewController {
        // Инициализация ViewController вручную
        let view = GetStartedViewController()
        
        // Создание VIPER компонентов
        let presenter = GetStartedPresenter()
        let interactor = GetStartedInteractor()
        let router = GetStartedRouter()
        
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
