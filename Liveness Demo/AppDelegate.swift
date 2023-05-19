//
//  AppDelegate.swift
//  Liveness Demo
//
//  Created by IVAN CHIRKOV on 05.05.2021.
//

import UIKit
import LunaCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppAppearance.setupAppearance()

        let lunaConfiguration = LCLunaConfiguration.defaultConfig()
        lunaConfiguration.lunaAccountID = "6d071cca-fda5-4a03-84d5-5bea65904480"
        lunaConfiguration.lunaServerURL = URL(string: "https://b24.bakai.kg/6")

        return true
    }

}

extension UIApplication {

    static func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl)
        }
    }

}
