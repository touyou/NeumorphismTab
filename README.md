<p align="center">
    <img src="https://github.com/touyou/NeumorphismTab/blob/master/resources/neumorphismtab.png" alt="NeumorphismTab" width="70%" />
</p>

<p align="center">
  <img src="http://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform" />
  <a href="https://developer.apple.com/swift">
    <img src="http://img.shields.io/badge/Swift-5.1-brightgreen.svg?style=flat" alt="Language">
  </a>
  <a href="https://github.com/Carthage/Carthage">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
  </a>
  <br />
  <a href="https://github.com/apple/swift-package-manager">
    <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
  </a>
  <a href="https://cocoapods.org/pods/NeumorphismTab">
    <img src="https://img.shields.io/cocoapods/v/Neumorphism.svg?style=flat" alt="Version" />
  </a>
  <a href="https://cocoapods.org/pods/NeumorphismTab">
    <img src="https://img.shields.io/cocoapods/l/Neumorphism.svg?style=flat" alt="License" />
  </a>
</p>

NeumorphismTab is custom TabBarController with Neumorphism design.

## Features
- Implement custom tab with neumorphism.
- UIView extension which add neumorphism shadow to any views.

## Requirements
- Xcode 11.0 or greater
- iOS 11 or greater
- Swift 5.1

## Installation
### Carthage

If you're using [Carthage](https://github.com/Carthage/Carthage), simply add
NeumorphismTab to your `Cartfile`:

```ruby
github "touyou/NeumorphismTab"
```

### CocoaPods

NeumorphismTab is available through [CocoaPods](https://cocoapods.org). To instal
it, simply add the following line to your Podfile:

```ruby
pod 'NeumorphismTab'
```

### Swift Package Manager
NeumorphismTab is available through `SwiftPM`, create ` Package.swift` and add `dependencies` value
```Package.swift
dependencies: [
    .package(url: "https://github.com/touyou/NeumorphismTab.git", from: "0.9.0")
]
```
See also: [GitHub - j-channings/swift-package-manager-ios: Example of how to use SPM v4 to manage iOS dependencies](https://github.com/j-channings/swift-package-manager-ios)

or you can use GUI based SPM with Xcode 11.

## Usage

### Basic Neumorphism Tab

Like this.

<p align="center">
    <img src="https://github.com/touyou/NeumorphismTab/blob/master/resources/demo.png" alt="NeumorphismTab" width="70%" />
</p>

Code is this.

```swift
import UIKit
import NeumorphismTab

class DemoTabBarController: NeumorphismTabBarController {

    override func setupView() {
        
        let color = UIColor(hex: "C1D2EB")
        let home = NeumorphismTabBarItem(icon: UIImage(systemName: "house.fill")!, title: "Home")
        let favorite = NeumorphismTabBarItem(icon: UIImage(systemName: "heart.fill")!, title: "")

        view.backgroundColor = color

        let homeViewController: ViewController = {
            let viewController = ViewController.instantiate()
            viewController.view.backgroundColor = color
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
```

NeumorphismTabBarController needs same background color throughout all view and ViewControllers.
In particular, a luminance of the color should be within **0.18 to 0.88**.

### Add Neumorphism to any view

`addNeumorphismShadow(with:)` can add neumorphism to any view. `with` is parent of the view.

```swift
let color = UIColor(hex: "C1D2EB")
view.backgroundColor = color
childView.backgroundColor = color
childView.layer.cornerRadius = childView.bounds.width / 2
childView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
childView.addNeumorphismShadow(with: view)
```

## License
NeumorphismTab is available under the MIT license. See the [LICENSE file](https://github.com/touyou/NeumorphismTab/blob/master/LICENSE) for more info.
