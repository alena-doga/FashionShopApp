//
//  PageContentViewController.swift
//  test
//
//  Created by Alena on 24.09.2024.
//

import UIKit

class PageContentViewController: UIViewController {
    
    var titleText: String
    var descriptionText: String
    var imageName: String
    var currentPage: Int
    var totalPages: Int
    var navigateToMainScreenClosure: (() -> Void)?
    let whiteView = UIView()
    let customPageControl = CustomPageControl()
    let descriptionLabel = UILabel()
    let lineView = UIView()
    
    init(titleText: String, descriptionText: String, imageName: String, currentPage: Int, totalPages: Int) {
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.imageName = imageName
        self.currentPage = currentPage
        self.totalPages = totalPages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.primaryGreen
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        whiteView.backgroundColor = .white
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем элементы в представление
        view.addSubview(imageView)
        view.addSubview(whiteView)
        
        let imageHeightConstraint: NSLayoutConstraint
        let screenHeight = UIScreen.main.bounds.height

        if isDeviceWithNotch() {
            imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 490)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 800) // Увеличиваем высоту на iPad
        } else if screenHeight == 667 { // Высота экрана iPhone SE (2-го и 3-го поколения)
            imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 400) // Специальная высота для SE
        } else {
            imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 540)
        }
        // Настройка констрейнтов для элементов
        NSLayoutConstraint.activate([
            // Констрейнты для изображения
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            imageHeightConstraint,
            
            // Констрейнты для белой вью
            whiteView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -240),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Добавляем текстовые элементы и pageControl
        setupTextContent()
        setupPageControl()
        setupStackView() // Вызовем setupStackView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Теперь, когда размеры установлены, добавляем дугу к белой вью
        addInvertedCurveToView(whiteView)
    }
    
    private func isDeviceWithNotch() -> Bool {
            // Проверка на устройство с "челкой" (iPhone X и новее)
            let screenHeight = UIScreen.main.bounds.height
            return (screenHeight == 812 || screenHeight == 896) // Размеры экранов iPhone X, XS, XR, 11, 12 и т.д.
        }
    
    
    private func addInvertedCurveToView(_ view: UIView) {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: view.bounds.width, y: 0), controlPoint: CGPoint(x: view.bounds.width / 2, y: 100))
        path.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: view.bounds.height))
        path.close()
        shapeLayer.path = path.cgPath
        view.layer.mask = shapeLayer
    }
    
    private func setupTextContent() {
        // Заголовок
        let titleLabel = UILabel()
        
        let fontSize = getDynamicFontSize(standardSize: 32, forSmallDevices: 28, forLargeDevices: 36)
        
        titleLabel.text = titleText
        titleLabel.font = UIFont(name: "Urbanist-Bold", size: fontSize)
        titleLabel.textColor = UIColor(named: "900")
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.setLineSpacing(lineSpacing: 4)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Настройка descriptionLabel
         
        let fontSized = getDynamicFontSize(standardSize: 18, forSmallDevices: 16, forLargeDevices: 20)
          
        descriptionLabel.text = descriptionText
        descriptionLabel.font = UIFont(name: "Urbanist-Regular", size: fontSized)
        descriptionLabel.textColor = UIColor(named: "700")
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.setLineSpacing(lineSpacing: 4)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем текстовые элементы в белую вью
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(descriptionLabel)
        
        
        let sidePadding: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 160 : 20

        // Настройка констрейнтов для заголовка и описания
        NSLayoutConstraint.activate([
            // Заголовок
            titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: sidePadding),
            titleLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -sidePadding),
            
            // Описание
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: sidePadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -sidePadding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupPageControl() {
        // Настройка кастомного PageControl
        customPageControl.numberOfPages = totalPages
        customPageControl.currentPage = currentPage
        customPageControl.activeIndicatorColor = UIColor(named: "ColorGreen") ?? .green
        customPageControl.inactiveIndicatorColor = .lightGray
        customPageControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Настройка линии под pageControl
        lineView.backgroundColor = UIColor(named: "100")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем кастомный PageControl и линию в белую вью
        whiteView.addSubview(customPageControl)
        whiteView.addSubview(lineView)
        
        // Настройка констрейнтов для кастомного PageControl и линии
        NSLayoutConstraint.activate([
            customPageControl.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            customPageControl.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            customPageControl.heightAnchor.constraint(equalToConstant: 8),
            
            lineView.topAnchor.constraint(equalTo: customPageControl.bottomAnchor, constant: 16),
            lineView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupStackView() {
        // Создаем кнопки
        let skipButton = createLightButton(title: "Skip")
        
        let continueButtonTitle = currentPage == totalPages - 1 ? "Let's Get Started" : "Continue"
        let continueButton = createGreenButton(title: continueButtonTitle)
        
        // Настраиваем действия для кнопок
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        
        // Настройка StackView
        let stackView = UIStackView(arrangedSubviews: currentPage == totalPages - 1 ? [continueButton] : [skipButton, continueButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем StackView в белую вью
        whiteView.addSubview(stackView)
        
        // Настройка констрейнтов для StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -24),
            stackView.heightAnchor.constraint(equalToConstant: 58)
        ])
    }

    // MARK: - Actions
    @objc private func skipTapped() {
        navigateToMainScreenClosure?()
    }
    
    @objc private func continueTapped() {
        if currentPage == totalPages - 1 {
            navigateToMainScreenClosure?()
        } else {
            NotificationCenter.default.post(name: NSNotification.Name("goToNextPage"), object: nil)
        }
    }
}






