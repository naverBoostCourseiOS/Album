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
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold) ]
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.isTranslucent = false
        
        window = makeWindow(scene: scene)
        
        configure(
            window: window,
            rootViewController: navigationController
        )
    }
    
}

// MARK: - Private Function
extension SceneDelegate {
    private func makeWindow(scene: UIScene) -> UIWindow? {
        guard let windowScene = (scene as? UIWindowScene) else { return nil }
        return UIWindow(windowScene: windowScene)
    }
    
    private func configure(
        window: UIWindow?,
        rootViewController: UIViewController
    ) {
        guard let window = window else { return }
        window.backgroundColor = .white
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
