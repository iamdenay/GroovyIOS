//
//  MainViewController.swift
//  Tennis
//
//  Created by Atabay Ziyaden on 27.09.17.
//  Copyright © 2017 IcyFlame Studios. All rights reserved.
//

import UIKit

fileprivate struct MainTabBarItem {
    var title: String?
    var icon: (UIImage?, UIImage?)
    var controller: UIViewController
}

class TabBarController: UITabBarController {
    
    fileprivate let tabBarItems = [
        MainTabBarItem(title: "Привычки", icon: (#imageLiteral(resourceName: "turniry"), #imageLiteral(resourceName: "turniry")),
                       controller: HabitsViewController()),
        MainTabBarItem(title: "Прогресс", icon: ( #imageLiteral(resourceName: "reiting"), #imageLiteral(resourceName: "reiting")),
                       controller: ProgressViewController()),
        MainTabBarItem(title: "Профиль", icon: (#imageLiteral(resourceName: "profile"), #imageLiteral(resourceName: "profile")),
                       controller: ProfileViewController())
            
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .gray
    }
    
    fileprivate func configureTabBarItem(_ tabBarItem: UITabBarItem?, title: String?,
                                         image: UIImage?, selectedImage: UIImage?) {
        tabBarItem?.title = title
        tabBarItem?.image = image
        tabBarItem?.selectedImage = selectedImage
    }
    
    func configureTabBar() {
        viewControllers = tabBarItems.compactMap { item in
            let nc = UINavigationController(rootViewController: item.controller)
            
            return nc
        }
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .gray
        tabBar.barTintColor = .white
        
        for (index, item) in tabBarItems.enumerated() {
            configureTabBarItem(tabBar.items![index],
                                title: item.title,
                                image: item.icon.0,
                                selectedImage: item.icon.1)
        }
    }
    
}


