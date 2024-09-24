//
//  OnboardingInteractor.swift
//  FashionShopApp
//
//  Created by Alena on 24.09.2024.
//

import Foundation

// Пишем бизнес логику (регистрация. обработка данных). Эта функция будет писаться в этом файле
protocol OnboardingInteractorInput {
  
}

// Пишем результат функции с HomeInteractorInput(например результат успешен или нет).Эти функции расписываются в Presenter
protocol OnboardingInteractorOutput: AnyObject {

}

// MARK: -
// расписываем логику этой  функции которая была в HomeInteractorInput

class OnboardingInteractor: OnboardingInteractorInput {
    
    weak var presenter: OnboardingInteractorOutput?
    
}
