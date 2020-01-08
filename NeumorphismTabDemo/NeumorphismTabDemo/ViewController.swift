//
//  ViewController.swift
//  NeumorphismTabDemo
//
//  Created by 藤井陽介 on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit
import NeumorphismTab

class ViewController: UIViewController {
    @IBOutlet weak var miniView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let color = UIColor(hex: "C1D2EB")
        view.backgroundColor = color
        miniView.backgroundColor = color
        miniView.layer.cornerRadius = miniView.bounds.width / 2
        miniView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        miniView.addNeumorphismShadow(with: view)
    }
}

