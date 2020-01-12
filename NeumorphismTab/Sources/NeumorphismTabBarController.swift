//
//  NeumorphismTabBarController.swift
//  NeumorphismTab
//
//  Created by touyou on 2020/01/08.
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

    public var backgroundColor: UIColor? = nil {
        didSet {
            guard let bgColor = backgroundColor else { return }
            guard let bar = neuTabBar else { return }

            tabShadows.forEach {
                $0.removeFromSuperview()
            }
            view.backgroundColor = bgColor
            bar.backgroundColor = bgColor
            tabShadows = bar.addNeumorphismShadow(with: view, dist: shadowOffset, blur: shadowBlur)
        }
    }

    private var neuTabBarHeight: CGFloat = 60
    private var tabShadows: [UIView] = []
    private var shadowOffset: CGFloat = 9
    private var shadowBlur: CGFloat = 16

    // MARK: - Open
    /// Override it if you want to adjust tab margin of left or right
    open var tabHorizontalMargin: CGFloat {
        get {
            return 48
        }
    }

    /// Override it if you want to adjust tab margin of bottom
    open var tabVerticalMargin: CGFloat {
        get {
            return 60
        }
    }

    /// Override it and initialize tab items and ViewControllers here.
    open func setupView() {}

    /// Call this function after switched tab
    open func switchedTab(to toIndex: Int) {}
}

// MARK: - Public
public extension NeumorphismTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isHidden = true
        setupView()
    }

    /// Set up tab bar.
    func setTabBar(
        items: [NeumorphismTabBarItem],
        height: CGFloat = 60,
        shadowOffset: CGFloat = 9,
        shadowBlur: CGFloat = 16) {
        guard items.count > 0 else { return }

        neuTabBar = NeumorphismTabBar(items: items, horizontalMargin: tabHorizontalMargin)
        guard let bar = neuTabBar else { return }
        self.shadowOffset = shadowOffset
        self.shadowBlur = shadowBlur
        neuTabBar.tintColor = normalColor
        bar.neuItems.first?.color = selectedColor

        view.addSubview(bar)
        bar.horizontal(toView: view, space: tabHorizontalMargin)
        bar.bottom(toView: view, space: -tabVerticalMargin)
        neuTabBarHeight = height
        bar.height(neuTabBarHeight)
        for i in 0 ..< items.count {
            items[i].tag = i
            items[i].addTarget(self, action: #selector(switchTab(button:)), for: .touchUpInside)
        }

        view.layoutIfNeeded()
        bar.backgroundColor = view.backgroundColor
        bar.layer.cornerRadius = neuTabBarHeight / 2
        tabShadows = bar.addNeumorphismShadow(with: view, dist: shadowOffset, blur: shadowBlur)
    }
}

// MARK: - Private
private extension NeumorphismTabBarController {

    @objc func switchTab(button: UIButton) {

        let newIndex = button.tag
        changeTab(from: selectedIndex, to: newIndex)
        switchedTab(to: newIndex)
    }

    func changeTab(from fromIndex: Int, to toIndex: Int) {

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
