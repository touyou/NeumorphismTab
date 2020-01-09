//
//  DemoTabBarController.swift
//  NeumorphismTabDemo
//
//  Created by touyou on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit
import NeumorphismTab

class DemoTabBarController: NeumorphismTabBarController {

    override func setupView() {
        
        let color = UIColor(hex: "C1D2EB")
        let home = NeumorphismTabBarItem(icon: UIImage(systemName: "house.fill")!, title: "Home")
        let favorite = NeumorphismTabBarItem(icon: UIImage(systemName: "heart.fill")!, title: "")

        view.backgroundColor = color

        let homeViewController: ViewController = {
            let viewController = ViewController.instantiate()
            viewController.view.backgroundColor = color
            return viewController
        }()

        let favoriteViewController: UIViewController = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = color
            return viewController
        }()

        setTabBar(items: [home, favorite])
        viewControllers = [homeViewController, favoriteViewController]
    }
}
