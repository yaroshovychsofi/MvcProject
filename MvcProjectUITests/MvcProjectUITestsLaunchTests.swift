//
//  MvcProjectUITestsLaunchTests.swift
//  MvcProjectUITests
//
//  Created by Софія Ярошович on 11.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//

import XCTest

final class MvcProjectUITestsLaunchTests: XCTestCase {

    override static var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
