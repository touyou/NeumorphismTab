//
//  NeumorphismTabBarController.swift
//  NeumorphismTab
//
//  Created by 藤井陽介 on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit

open class NeumorphismTabBarController: UITabBarController {
    var neuTabBar: NeumorphismTabBar!
    var selectedColor = UIColor.darkGray
    var normalColor = UIColor.lightGray {
        didSet {
            neuTabBar.tintColor = normalColor
        }
    }

    private var neuTabBarHeight: CGFloat = 60

    override open func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        setupView()
    }

    open func setupView() {}

    open func setTabBar(items: [NeumorphismTabBarItem], height: CGFloat = 60) {
        guard items.count > 0 else { return }

        neuTabBar = NeumorphismTabBar(items: items)
        guard let bar = neuTabBar else { return }
        neuTabBar.tintColor = normalColor
        bar.neuItems.first?.color = selectedColor

        view.addSubview(bar)
        bar.horizontal(toView: view, space: 48)
        bar.bottom(toView: view, space: -60)
        neuTabBarHeight = height
        bar.height(neuTabBarHeight)
        for i in 0 ..< items.count {
            items[i].tag = i
            items[i].addTarget(self, action: #selector(switchTab(button:)), for: .touchUpInside)
        }

        view.layoutIfNeeded()
        bar.backgroundColor = view.backgroundColor
        bar.layer.cornerRadius = neuTabBarHeight / 2
        bar.addNeumorphismShadow(with: view)
    }

    @objc func switchTab(button: UIButton) {
        let newIndex = button.tag
        changeTab(from: selectedIndex, to: newIndex)
    }

    private func changeTab(from fromIndex: Int, to toIndex: Int) {
        neuTabBar.neuItems[fromIndex].color = normalColor
        neuTabBar.neuItems[toIndex].color = selectedColor

        guard fromIndex != toIndex else { return }
        guard let fromController = viewControllers?[fromIndex],
            let toController = viewControllers?[toIndex] else { return }
        let fromView = fromController.view!
        let toView = toController.view!
        let viewSize = fromView.frame
        fromView.superview?.addSubview(toView)
        toView.frame = CGRect(x: 0, y: viewSize.origin.y, width: UIScreen.main.bounds.width, height: viewSize.height)
        fromView.removeFromSuperview()
        selectedIndex = toIndex
    }
}
