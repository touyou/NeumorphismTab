//
//  UIView+Neumorphism.swift
//  NeumorphismTab
//
//  Created by touyou on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import UIKit

// MARK: - Shadow Method
public extension UIView {

    @discardableResult
    func addNeumorphismShadow(with parent: UIView, dist: CGFloat = 9, blur: CGFloat = 16) -> [UIView] {

        guard let backgroundColor = backgroundColor else { return [] }
        let shadowViews = neumorphismShadowViews(color: backgroundColor, dist: dist, blur: blur)
        shadowViews.forEach {
            parent.insertSubview($0, belowSubview: self)
        }
        return shadowViews
    }

    func neumorphismShadowViews(color: UIColor, dist: CGFloat, blur: CGFloat) -> [UIView] {

        let lightShadowView: UIView = {
            let lightView = UIView(frame: frame)
            let lightColor = color.lighterColor(value: 0.12)
            lightView.backgroundColor = .white
            lightView.layer.applyShadow(color: lightColor, alpha: 0.5, x: -dist, y: -dist, blur: blur)
            lightView.layer.cornerRadius = layer.cornerRadius
            lightView.layer.maskedCorners = layer.maskedCorners
            return lightView
        }()
        let darkShadowView: UIView = {
            let darkView = UIView(frame: frame)
            let darkColor = color.darkerColor(value: 0.18)
            darkView.backgroundColor = .white
            darkView.layer.applyShadow(color: darkColor, alpha: 0.5, x: dist, y: dist, blur: blur)
            darkView.layer.cornerRadius = layer.cornerRadius
            darkView.layer.maskedCorners = layer.maskedCorners
            return darkView
        }()
        return [lightShadowView, darkShadowView]
    }
}

// MARK: - Support Shadow Layer
extension CALayer {

    func applyShadow(color: UIColor = .black, alpha: Float = 0.5,
                   x: CGFloat = 0, y: CGFloat = 2,
                   blur: CGFloat = 4, spread: CGFloat = 0) {

        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        masksToBounds = false
    }
}

// MARK: - Support UIColor Extension
public extension UIColor {

    convenience init(hex: String, alpha: CGFloat = 1.0) {
        
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }

    func lighterColor(value: CGFloat) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a) else { return self }

        let hsl = hsbToHsl(h: h, s: s, b: b)
        let hsb = hslToHsb(h: hsl.h, s: hsl.s, l: hsl.l + value)

        return UIColor(hue: hsb.h, saturation: hsb.s, brightness: hsb.b, alpha: a)
    }

    func darkerColor(value: CGFloat) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a) else { return self }

        let hsl = hsbToHsl(h: h, s: s, b: b)
        let hsb = hslToHsb(h: hsl.h, s: hsl.s, l: hsl.l - value)

        return UIColor(hue: hsb.h, saturation: hsb.s, brightness: hsb.b, alpha: a)
    }

    private func hsbToHsl(h: CGFloat, s: CGFloat, b: CGFloat) -> (h: CGFloat, s: CGFloat, l: CGFloat) {

        let newH = h
        var newL = (2.0 - s) * b
        var newS = s * b
        newS /= (newL <= 1.0 ? newL : 2.0 - newL)
        newL /= 2.0
        return (h: newH, s: newS, l: newL)
    }

    private func hslToHsb(h: CGFloat, s: CGFloat, l: CGFloat) -> (h: CGFloat, s: CGFloat, b: CGFloat) {
        let newH = h
        let ll = l * 2.0
        let ss = s * (ll <= 1.0 ? ll : 2.0 - ll)
        let newB = (ll + ss) / 2.0
        let newS = (2.0 * ss) / (ll + ss)
        return (h: newH, s: newS, b: newB)
    }
}
