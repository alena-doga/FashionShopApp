//
//  OnboardingPresenter.swift
//  FashionShopApp
//
//  Created by Alena on 24.09.2024.
//

import Foundation
import UIKit

// Пишем тут функция которая будет обрабатывать интерфейс и писаться в ViewController
protocol OnboardingViewInput: AnyObject {
    
}

// Пишем функцию нажатия на кнопку(или другой элемент) в которой будет метод с Interactor
protocol OnboardingViewOutput {
    func goNextScreeen()
}

// MARK: -

// Рассписываем тут функцию с HomeViewOutput
class OnboardingPresenter: OnboardingViewOutput {
    
    weak var view: OnboardingViewInput?
    var interactor: OnboardingInteractorInput?
    var router: OnboardingRouterInput?
  
    
    func goNextScreeen() {
        if let viewController = view as? UIViewController {
            router?.navigateToLetsGetStarted(from: viewController)
        }
    }
}


// Расписываем тут функции с HomeInteractorOutput(что должно произойти дальше)
extension OnboardingPresenter: OnboardingInteractorOutput {
    
}
