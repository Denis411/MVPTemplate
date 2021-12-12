//
//  SceneDelegate.swift
//  MVPTemplate
//
//  Created by I am the owner on 12/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneOne = (scene as? UIWindowScene) else { return }
        let vc = MainScreen()
        window = UIWindow(windowScene: sceneOne)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

