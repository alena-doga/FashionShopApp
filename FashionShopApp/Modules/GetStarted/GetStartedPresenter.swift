//
//  GetStartedPresenter.swift
//  FashionShopApp
//
//  Created by Alena on 25.09.2024.
//

import Foundation
import UIKit

// Пишем тут функция которая будет обрабатывать интерфейс и писаться в ViewController
protocol GetStartedViewInput: AnyObject {
    
}

// Пишем функцию нажатия на кнопку(или другой элемент) в которой будет метод с Interactor
protocol GetStartedViewOutput {
}

// MARK: -

// Рассписываем тут функцию с HomeViewOutput
class GetStartedPresenter: GetStartedViewOutput {
    
    weak var view: GetStartedViewInput?
    var interactor: GetStartedInteractorInput?
    var router: GetStartedRouterInput?
    
    }

// Расписываем тут функции с HomeInteractorOutput(что должно произойти дальше)
extension GetStartedPresenter: GetStartedInteractorOutput {
    
}

