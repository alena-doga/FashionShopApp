//
//  CustomPageControl.swift
//  test
//
//  Created by Alena on 24.09.2024.
//

import UIKit

class CustomPageControl: UIView {
    
    var numberOfPages: Int = 0 {
        didSet {
            setupIndicators()
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            updateIndicatorStates()
        }
    }
    
    var activeIndicatorColor: UIColor = UIColor.primaryGreen
    var inactiveIndicatorColor: UIColor = UIColor(named: "200") ?? .gray
    
    private var indicators: [UIView] = []
    
    // Настройка индикаторов
    private func setupIndicators() {
        // Удаляем старые индикаторы
        indicators.forEach { $0.removeFromSuperview() }
        indicators.removeAll()
        
        // Добавляем новые индикаторы
        for _ in 0..<numberOfPages {
            let indicator = UIView()
            indicator.backgroundColor = inactiveIndicatorColor
            indicator.layer.cornerRadius = 4
            indicator.translatesAutoresizingMaskIntoConstraints = false
            addSubview(indicator)
            indicators.append(indicator)
        }
        
        setNeedsLayout()
    }
    
    // Обновляем состояние индикаторов
    private func updateIndicatorStates() {
        for (index, indicator) in indicators.enumerated() {
            if index == currentPage {
                // Настройка активного индикатора
                indicator.backgroundColor = activeIndicatorColor
                indicator.layer.cornerRadius = 4
                indicator.constraints.forEach { constraint in
                    if constraint.firstAttribute == .width {
                        constraint.constant = 20 // Длинный активный индикатор
                    }
                }
            } else {
                // Настройка неактивных индикаторов
                indicator.backgroundColor = inactiveIndicatorColor
                indicator.layer.cornerRadius = 4
                indicator.constraints.forEach { constraint in
                    if constraint.firstAttribute == .width {
                        constraint.constant = 8 // Круглые неактивные индикаторы
                    }
                }
            }
        }
    }
    
    // Устанавливаем констрейнты для индикаторов
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let spacing: CGFloat = 8
        let inactiveIndicatorWidth: CGFloat = 8
        let activeIndicatorWidth: CGFloat = 20
        var totalWidth: CGFloat = 0
        
        // Вычисляем общую ширину для центрирования
        for (index, _) in indicators.enumerated() {
            totalWidth += (index == currentPage) ? activeIndicatorWidth : inactiveIndicatorWidth
            if index != indicators.count - 1 {
                totalWidth += spacing
            }
        }
        
        // Определяем начальную позицию для центрирования индикаторов
        var startX = (self.bounds.width - totalWidth) / 2
        
        // Устанавливаем фреймы для каждого индикатора
        for (index, indicator) in indicators.enumerated() {
            let indicatorWidth = (index == currentPage) ? activeIndicatorWidth : inactiveIndicatorWidth
            indicator.frame = CGRect(x: startX, y: 0, width: indicatorWidth, height: inactiveIndicatorWidth)
            startX += indicatorWidth + spacing
        }
    }
}
