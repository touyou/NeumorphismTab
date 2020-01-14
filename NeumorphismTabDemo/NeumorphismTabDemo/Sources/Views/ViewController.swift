//
//  ViewController.swift
//  NeumorphismTabDemo
//
//  Created by touyou on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit
import NeumorphismTab

class ViewController: UIViewController {
    @IBOutlet weak var miniView: UIView!

    private var shadowViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // TODO: simpler solution
        if shadowViews.isEmpty {
            let color = UIColor(hex: "C1D2EB")
            miniView.backgroundColor = color
            miniView.layer.cornerRadius = miniView.bounds.width / 2
            miniView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
            shadowViews = miniView.addNeumorphismShadow(with: view)
        }
    }
}

extension ViewController: StoryboardInstantiable {}
