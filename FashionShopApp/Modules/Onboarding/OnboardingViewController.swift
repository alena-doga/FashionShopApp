//
//  OnboardingViewController.swift
//  FashionShopApp
//
//  Created by Alena on 24.09.2024.
//

import UIKit

class OnboardingViewController: UIPageViewController, OnboardingViewInput {
    
    var output: OnboardingViewOutput?
    var pages: [PageContentViewController] = []
    var currentPageIndex: Int = 0
    
    
    init() {
            super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }
     
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
 //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        // Subscribe to a notification for turning pages
        NotificationCenter.default.addObserver(self, selector: #selector(goToNextPage), name: NSNotification.Name("goToNextPage"), object: nil)
        
        let page1 = PageContentViewController(
            titleText: "Explore Fashion Trends with Trendify",
            descriptionText: "Dive into the world of fashion with Trendify, where you can discover the latest and hottest styles curated just for you.",
            imageName: "phone1",
            currentPage: 0,
            totalPages: 3
        )
        
        let page2 = PageContentViewController(
            titleText: "Your Style, Your Trendify Experience",
            descriptionText: "Trendify goes beyond fashion - it's a personalized style journey. Start your fashion adventure with Trendify today",
            imageName: "phone2",
            currentPage: 1,
            totalPages: 3
        )
        
        let page3 = PageContentViewController(
            titleText: "Seamless Fashion, Seamless Shopping",
            descriptionText: "Trendify offers an effortless shopping experience, making your style journey smoother than ever.",
            imageName: "phone3",
            currentPage: 2,
            totalPages: 3
        )

        // Устанавливаем начальную страницу
        page1.navigateToMainScreenClosure = { [weak self] in
            self?.navigateToMainScreen()
        }
        
        page2.navigateToMainScreenClosure = { [weak self] in
            self?.navigateToMainScreen()
        }
        
        page3.navigateToMainScreenClosure = { [weak self] in
            self?.navigateToMainScreen()
        }
        
        pages = [page1, page2, page3]
        
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        }
    }

    private func navigateToMainScreen() {
        output?.goNextScreeen()
    }
    
 // MARK: - Turning pages
    
    @objc private func goToNextPage() {
        if let currentVC = viewControllers?.first,
           let currentIndex = pages.firstIndex(of: currentVC as! PageContentViewController),
           currentIndex < pages.count - 1 {
            let nextVC = pages[currentIndex + 1]
            setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

 // MARK: - Extension for OnboardingViewController (delegate,dataSource)

extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // This function is called when the user swipes or swipes back (left).
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! PageContentViewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }
    
    // This function is called when the user swipes or swipes forward (right).
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! PageContentViewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}
