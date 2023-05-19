//
//  AppAppearance.swift
//  FaceEngineMobileDemo
//
//  Created on 07.11.16.
//  Copyright © 2016 Vision Labs. All rights reserved.
//

import UIKit

class AppAppearance {
    
    static let detectionAreaValidColor = UIColor.green
    static let detectionAreaInvalidColor = UIColor.red
    
    class func setupAppearance() {
        UINavigationBar.appearance().tintColor = Colors.blue
        UINavigationBar.appearance().titleTextAttributes = [
            .font: Fonts.etelka_17
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [.font: Fonts.etelka_17],
            for: [.normal])
        
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [.font: Fonts.etelka_17],
            for: [.highlighted])
    }
    
}
