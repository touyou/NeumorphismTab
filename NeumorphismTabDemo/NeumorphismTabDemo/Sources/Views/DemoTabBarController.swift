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
    override var tabHorizontalMargin: CGFloat {
        get {
            return 24
        }
    }

    override var tabVerticalMargin: CGFloat {
        get {
            return 48
        }
    }

    override func setupView() {
        
        let color = UIColor(hex: "C1D2EB")
        let secondColor = UIColor(hex: "5E35B1")
        let home = NeumorphismTabBarItem(icon: UIImage(systemName: "house.fill")!, title: "")
        let favorite = NeumorphismTabBarItem(icon: UIImage(systemName: "heart.fill")!, title: "")

        view.backgroundColor = color

        let homeViewController: ViewController = {
            let viewController = ViewController.instantiate()
            viewController.view.backgroundColor = color
            return viewController
        }()

        let favoriteViewController: UIViewController = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = secondColor
            return viewController
        }()

        setTabBar(items: [home, favorite], height: 80, shadowOffset: 12, shadowBlur: 12)
        viewControllers = [homeViewController, favoriteViewController]
    }

    override func switchedTab(to toIndex: Int) {

        backgroundColor = viewControllers?[toIndex].view.backgroundColor
    }
}
