//
//  UIView+Constraints.swift
//  NeumorphismTab
//
//  Created by touyou on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//
// ref: https://github.com/nguyentruongky/knTabController/blob/master/knTabController/mustHave/knConstraints.swift

import UIKit

// MARK: - Basic Method
public extension UIView {

    func addConstraint(
        attribute: NSLayoutConstraint.Attribute,
        equalTo view: UIView,
        toAttribute: NSLayoutConstraint.Attribute,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: view, attribute: toAttribute, multiplier: multiplier, constant: constant)
        return constraint
    }

    func addConstraints(withFormat format: String, views: [UIView]) {

        var viewsDictionary = [String: UIView]()
        for i in 0 ..< views.count {
            let key = "v\(i)"
            views[i].translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = views[i]
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }

    func addConstraints(withFormat format: String, views: UIView...) {

        addConstraints(withFormat: format, views: views)
    }

    func removeAllConstraints() {

        removeConstraints(constraints)
    }

    func addSubviews(views: UIView...) {

        for view in views {
            addSubview(view)
        }
    }
}

// MARK: - Layout Method
public extension UIView {

    @discardableResult
    func left(toAnchor anchor: NSLayoutXAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = leftAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func left(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func right(toAnchor anchor: NSLayoutXAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = rightAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func right(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = rightAnchor.constraint(equalTo: view.rightAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func top(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = topAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func top(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottom(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottom(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topLeft(toView view: UIView, top: CGFloat = 0, left: CGFloat = 0) -> [NSLayoutConstraint] {

        let topConstraint = self.top(toView: view, space: top)
        let leftConstraint = self.left(toView: view, space: left)
        return [topConstraint, leftConstraint]
    }

    @discardableResult
    func topRight(toView view: UIView, top: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint] {

        let topConstraint = self.top(toView: view, space: top)
        let rightConstraint = self.right(toView: view, space: right)
        return [topConstraint, rightConstraint]
    }

    @discardableResult
    func bottomLeft(toView view: UIView, bottom: CGFloat = 0, left: CGFloat = 0) -> [NSLayoutConstraint] {

        let bottomConstraint = self.bottom(toView: view, space: bottom)
        let leftConstraint = self.left(toView: view, space: left)
        return [bottomConstraint, leftConstraint]
    }

    @discardableResult
    func bottomRight(toView view: UIView, bottom: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint] {

        let bottomConstraint = self.bottom(toView: view, space: bottom)
        let rightConstraint = self.right(toView: view, space: right)
        return [bottomConstraint, rightConstraint]
    }

    @discardableResult
    func verticalSpacing(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func horizontalSpacing(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = rightAnchor.constraint(equalTo: view.leftAnchor, constant: -space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftHorizontalSpacing(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = leftAnchor.constraint(equalTo: view.rightAnchor, constant: -space)
        constraint.isActive = true
        return constraint
    }
}

// MARK: - Size Method
public extension UIView {

    @discardableResult
    func width(_ width: CGFloat) -> NSLayoutConstraint {

        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func width(toDimension dimension: NSLayoutDimension, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = widthAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func width(toView view: UIView, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func height(_ height: CGFloat) -> NSLayoutConstraint {

        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func height(toDimension dimension: NSLayoutDimension, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = heightAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func height(toView view: UIView, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }

    func size(_ size: CGSize) {

        width(size.width)
        height(size.height)
    }

    func size(toView view: UIView, greater: CGFloat = 0) {

        width(toView: view, greater: greater)
        height(toView: view, greater: greater)
    }

    func square(edge: CGFloat) {

        size(CGSize(width: edge, height: edge))
    }

    func square() {

        width(toDimension: heightAnchor, multiplier: 1, greater: 0)
    }
}

// MARK: Align Method
public extension UIView {

    @discardableResult
    func centerX(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerX(toAnchor anchor: NSLayoutXAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerY(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerY(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {

        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }

    func center(toView view: UIView, space: CGFloat = 0) {

        centerX(toView: view, space: space)
        centerY(toView: view, space: space)
    }
}

// MARK: Fill Method
public extension UIView {

    func horizontal(toView view: UIView, space: CGFloat = 0) {

        left(toAnchor: view.leftAnchor, space: space)
        right(toAnchor: view.rightAnchor, space: -space)
    }

    func horizontal(toView view: UIView, leftPadding: CGFloat, rightPadding: CGFloat) {

        left(toAnchor: view.leftAnchor, space: leftPadding)
        right(toAnchor: view.rightAnchor, space: rightPadding)
    }

    func vertical(toView view: UIView, space: CGFloat = 0) {

        top(toAnchor: view.topAnchor, space: space)
        bottom(toAnchor: view.bottomAnchor, space: -space)
    }

    func vertical(toView view: UIView, topPadding: CGFloat, bottomPadding: CGFloat) {

        top(toAnchor: view.topAnchor, space: topPadding)
        bottom(toAnchor: view.bottomAnchor, space: bottomPadding)
    }

    func fill(toView view: UIView, space: UIEdgeInsets = .zero) {

        left(toView: view, space: space.left)
        right(toView: view, space: -space.right)
        top(toView: view, space: space.top)
        bottom(toView: view, space: -space.bottom)
    }
}
