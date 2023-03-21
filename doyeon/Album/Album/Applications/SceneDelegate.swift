//
//  SceneDelegate.swift
//  Album
//
//  Created by Doyeon on 2023/03/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene) // SceneDelegate의 프로퍼티에 설정
        let mainViewController = ViewController() // 맨 처음 보여줄 ViewController
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController // RootViewController로 설정
        window?.makeKeyAndVisible() // 윈도우에 보이게 설정
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
