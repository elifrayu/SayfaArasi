//
//  ProfileViewController.swift
//  SayfaArasi
//
//  Created by elif uyar on 24.11.2026.
//

import UIKit

final class ProfileViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI(){
        view.backgroundColor = AppColors.background
        title = "Profil"
    }
}
