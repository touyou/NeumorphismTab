//
//  NeumorphismTabBarItem.swift
//  NeumorphismTab
//
//  Created by touyou on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit

public class NeumorphismTabBarItem: UIButton {
    
    var itemHeight: CGFloat = 0
    var lock = false
    var color: UIColor = UIColor.lightGray {
        didSet {
            guard !lock else { return }
            
            iconImageView.tintColor = color
            textLabel.textColor = color
        }
    }
    
    private let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private let textLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
}

// MARK: - Public
public extension NeumorphismTabBarItem {

    convenience init(icon: UIImage, title: String, font: UIFont = UIFont.systemFont(ofSize: 11)) {
        self.init()

        translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = icon.withRenderingMode(.alwaysTemplate)
        textLabel.text = title
        textLabel.font = UIFont(name: font.fontName, size: 11)
        setupView()
    }
}

// MARK: - Private
private extension NeumorphismTabBarItem {
    
    func setupView() {
        
        addSubviews(views: iconImageView, textLabel)
        iconImageView.top(toView: self, space: 8)
        iconImageView.centerX(toView: self)
        iconImageView.square()
        let iconBottomConstant: CGFloat = textLabel.text == "" ? -8 : -24
        iconImageView.bottom(toView: self, space: iconBottomConstant)

        textLabel.bottom(toView: self, space: -8)
        textLabel.centerX(toView: self)
    }
}
