//
//  GetStartedInteractor.swift
//  FashionShopApp
//
//  Created by Alena on 25.09.2024.
//

import Foundation

// Пишем бизнес логику (регистрация. обработка данных). Эта функция будет писаться в этом файле
protocol GetStartedInteractorInput {
  
}

// Пишем результат функции с HomeInteractorInput(например результат успешен или нет).Эти функции расписываются в Presenter
protocol GetStartedInteractorOutput: AnyObject {

}

// MARK: -
// расписываем логику этой  функции которая была в HomeInteractorInput

class GetStartedInteractor: GetStartedInteractorInput {
    
    weak var presenter: GetStartedInteractorOutput?
    
}
