//
//  SceneDelegate.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Use this method to optionally configure and attach the UIWindow window to the provided
        // UIWindowScene scene. If using a storyboard, the window property will automatically be
        // Initialized and attached to the scene. This delegate does not imply the connecting scene or
        // Session are new (see application:configurationForConnectingSceneSession instead).

        let networkService: NetworkServiceProtocol = NetworkService()
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = RateViewController(service: networkService)
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
