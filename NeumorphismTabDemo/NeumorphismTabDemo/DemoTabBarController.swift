//
//  DemoTabBarController.swift
//  NeumorphismTabDemo
//
//  Created by 藤井陽介 on 2020/01/08.
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

        let homeViewController: UIViewController = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = color
            let label = UILabel()
            label.text = "First"
            label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            label.center = viewController.view.center
            viewController.view.addSubview(label)
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
