//
//  Lesson_9_10_UINavigationViewController___UIBarButtonItem___Ordering_pizzaUITestsLaunchTests.swift
//  Lesson 9-10 UINavigationViewController + UIBarButtonItem - Ordering pizzaUITests
//
//  Created by Валентин Ремизов on 03.02.2023.
//

import XCTest

final class Lesson_9_10_UINavigationViewController___UIBarButtonItem___Ordering_pizzaUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
