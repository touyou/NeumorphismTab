//
//  NeumorphismTabBar.swift
//  NeumorphismTab
//
//  Created by 藤井陽介 on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit

public class NeumorphismTabBar: UIView {

    var neuItems = [NeumorphismTabBarItem]()
}

// MARK: - Public
public extension NeumorphismTabBar {

    override var tintColor: UIColor! {
        didSet {
            for item in neuItems {
                item.color = tintColor
            }
        }
    }

    convenience init(items: [NeumorphismTabBarItem]) {
        self.init()

        neuItems = items
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
}

// MARK: - Private
private extension NeumorphismTabBar {

    func setupView() {
        if neuItems.isEmpty { return }

        var horizontalConstraints = "H:|"
        let itemWidth = (UIScreen.main.bounds.width - 48 * 2) / CGFloat(neuItems.count)
        for i in 0 ..< neuItems.count {
            let item = neuItems[i]
            addSubview(item)
            if item.itemHeight == 0 {
                item.vertical(toView: self)
            } else {
                item.bottom(toView: self)
                item.height(item.itemHeight)
            }
            item.width(itemWidth)
            horizontalConstraints += String(format: "[v%d]", i)
            if !item.lock {
                item.color = tintColor
            }
        }
        horizontalConstraints += "|"
        addConstraints(withFormat: horizontalConstraints, views: neuItems)
    }
}
