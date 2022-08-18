//
//  BKTabbarController.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 18.08.2022.
//

import UIKit

class BKTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [createMainNC(), createSearchNC()]
        UITabBar.appearance().tintColor = .brown
        
    }
    
    func createMainNC() -> UINavigationController {
        let mainVC = MainVC()
        mainVC.title = "Main"
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    
}
