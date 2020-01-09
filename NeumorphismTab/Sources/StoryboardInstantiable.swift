//
//  StoryboardInstantiable.swift
//  NeumorphismTab
//
//  Created by touyou on 2020/01/09.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiable {
    static var storyboardName: String { get }
}

public extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardName: String {
        String(describing: self)
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: Self.storyboardName, bundle: nil)

        guard let controller = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Not found \(Self.storyboardName).swift")
        }

        return controller
    }
}

