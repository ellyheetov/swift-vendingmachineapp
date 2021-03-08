//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let vendingMachine = VendingMachine()
    let stockCellViews = ViewsUtility.getEachStock(names: ["banana", "chocolate", "stroberry", "coke", "hot6ixRed", "top", "georgia","cantata"])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

