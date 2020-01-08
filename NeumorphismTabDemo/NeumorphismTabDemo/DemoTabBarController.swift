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

        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = color
        let label = UILabel()
        label.text = "First"
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        label.center = homeViewController.view.center
        homeViewController.view.addSubview(label)

        let favoriteViewController = UIViewController()
        favoriteViewController.view.backgroundColor = color

        setTabBar(items: [home, favorite])
        viewControllers = [homeViewController, favoriteViewController]
    }
}
