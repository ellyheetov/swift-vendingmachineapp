//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    func sceneWillResignActive(_ scene: UIScene) {
        DataManager.save(data: (UIApplication.shared.delegate as! AppDelegate).vendingMachine!)
    }
}

