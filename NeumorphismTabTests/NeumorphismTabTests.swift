//
//  NeumorphismTabTests.swift
//  NeumorphismTabTests
//
//  Created by touyou on 2020/01/08.
//  Copyright © 2020 touyou. All rights reserved.
//

import XCTest
@testable import NeumorphismTab

class NeumorphismTabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_lighterColor() {
        let color = UIColor(hue: 0.5, saturation: 0.8, brightness: 0.9, alpha: 1.0)
        let sameColor = color.lighterColor(value: 0.0)

        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        if sameColor.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            XCTAssertEqual(0.5, h, accuracy: 0.1)
            XCTAssertEqual(0.8, s, accuracy: 0.1)
            XCTAssertEqual(0.9, b, accuracy: 0.1)
        } else {
            XCTFail("Cannot get HSB value.")
        }
    }

}
