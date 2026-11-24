//
//  AppColors.swift
//  SayfaArasi
//
//  Created by elif uyar on 24.11.2026.
//

import UIKit

enum AppColors{
    static let background = UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(
                red: 0.08,
                green: 0.08,
                blue: 0.08,
                alpha: 1.0
            )
        }else{
            return UIColor(
                red: 0.97,
                green: 0.95,
                blue: 0.91,
                alpha: 1.0
            )
        }
    }
    
    static let primaryText = UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return .white
        }else {
            return UIColor(
                red: 0.12,
                green: 0.12,
                blue: 0.12,
                alpha: 1.0
            )
        }
        
    }

    static let tabBarBackground = UIColor(
        red: 0.12,
        green: 0.12,
        blue: 0.12,
        alpha: 1.0
    )

    static let tabBarSelected = UIColor(
        red: 0.97,
        green: 0.95,
        blue: 0.91,
        alpha: 1.0
    )

    static let tabBarUnselected = UIColor.gray
    
}
