//
//  GetStartedViewController.swift
//  FashionShopApp
//
//  Created by Alena on 25.09.2024.
//

import UIKit

final class GetStartedViewController: UIViewController, GetStartedViewInput {
   
    var output: GetStartedViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
    }
}
