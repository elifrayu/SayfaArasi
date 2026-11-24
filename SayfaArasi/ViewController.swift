//
//  ViewController.swift
//  SayfaArasi
//
//  Created by elif uyar on 19.11.2026.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.background
        print("1-viewdidload")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("2-we will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            print("3 - viewDidAppear")
        }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("4 - viewWillDisappear")
        }

}

