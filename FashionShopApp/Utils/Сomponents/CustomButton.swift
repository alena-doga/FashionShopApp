//
//  CustomButton.swift
//  FashionShopApp
//
//  Created by Alena on 25.09.2024.
//

import Foundation
import UIKit

func createGreenButton(title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.backgroundColor = UIColor.primaryGreen
    button.setTitleColor(UIColor.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "Urbanist-Bold", size: 16) // Устанавливаем размер и вес шрифта
    button.layer.cornerRadius = 25
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}

func createLightButton(title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.backgroundColor = UIColor.backgroundPrimary
    button.setTitleColor(UIColor.primaryGreen, for: .normal)
    button.titleLabel?.font = UIFont(name: "Urbanist-Bold", size: 16) // Устанавливаем размер и вес шрифта
    button.layer.cornerRadius = 25
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}
