//
//  AppCoordinator.swift
//  SayfaArasi
//
//  Created by elif uyar on 24.11.2026.
//

import UIKit

final class AppCoordinator {
    
    private let window: UIWindow
    private let libraryNav = UINavigationController()
    private let profileNav = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
            setupLibrary()
            setupProfile()
            setupTabBar()
        }
    
    private func setupLibrary() {

            let libraryVC = LibraryViewController()

            libraryVC.onSearchTapped = { [weak self] in
                self?.showSearch()
            }

            libraryNav.setViewControllers(
                [libraryVC],
                animated: false
            )

            libraryNav.tabBarItem = UITabBarItem(
                title: "Kütüphane",
                image: UIImage(systemName: "books.vertical"),
                tag: 0
            )
        }
    
    private func setupProfile() {

           let profileVC = ProfileViewController()

           profileNav.setViewControllers(
               [profileVC],
               animated: false
           )

           profileNav.tabBarItem = UITabBarItem(
               title: "Profil",
               image: UIImage(systemName: "person"),
               tag: 1
           )
       }
    private func setupTabBar() {
            let tabBarController = UITabBarController()

            tabBarController.viewControllers = [
                libraryNav,
                profileNav
            ]

            tabBarController.tabBar.tintColor = AppColors.tabBarSelected

            tabBarController.tabBar.unselectedItemTintColor =
                AppColors.tabBarUnselected
        
            window.rootViewController = tabBarController

            window.makeKeyAndVisible()
        
        }
    
    private func showSearch(){
        let searchVC = SearchViewController()
        libraryNav.pushViewController(searchVC, animated: true)
    }
    
    }

