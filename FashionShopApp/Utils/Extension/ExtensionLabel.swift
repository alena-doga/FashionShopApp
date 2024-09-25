//
//  ExtensionLabel.swift
//  FashionShopApp
//
//  Created by Alena on 25.09.2024.
//

import Foundation
import UIKit

extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat) {
        guard let text = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = self.textAlignment // Убедитесь, что выравнивание соответствует настройкам UILabel
        
        let attributedString: NSMutableAttributedString
        if let currentAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: currentAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: text)
        }
        
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}

func getDynamicFontSize(standardSize: CGFloat, forSmallDevices smallDeviceSize: CGFloat? = nil, forLargeDevices largeDeviceSize: CGFloat? = nil) -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    
    // Условие для небольших экранов (например, iPhone SE)
    if screenHeight <= 667 {
        return smallDeviceSize ?? standardSize // Если не задано значение для маленьких экранов, используем стандартный размер
    }
    
    // Условие для больших экранов (например, iPad)
    if UIDevice.current.userInterfaceIdiom == .pad {
        return largeDeviceSize ?? standardSize // Если не задано значение для больших экранов, используем стандартный размер
    }
    
    // Стандартный размер для обычных экранов
    return standardSize
}
