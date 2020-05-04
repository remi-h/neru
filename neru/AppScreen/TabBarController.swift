//
//  TabBarController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    let worldVC:WorldViewController = WorldViewController()
    let scheduleVC:ScheduleViewController = ScheduleViewController()
    let homeVC:HomeViewController = HomeViewController()
    let settingVC:SettingViewController = SettingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worldVC.tabBarItem = UITabBarItem(title: "WORLD", image: #imageLiteral(resourceName: "tabbar_world"), tag: 1)
        scheduleVC.tabBarItem = UITabBarItem(title: "SCHEDULE", image: #imageLiteral(resourceName: "tabbar_schedule"), tag: 2)
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: #imageLiteral(resourceName: "tabbar_home"), tag: 3)
        settingVC.tabBarItem = UITabBarItem(title: "SETTING", image: #imageLiteral(resourceName: "tabbar_setting"), tag: 4)
        
        let tabs:[UIViewController] = [
            UINavigationController(rootViewController: worldVC),
            UINavigationController(rootViewController: scheduleVC),
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: settingVC)
        ]
        
        self.setViewControllers(tabs, animated: true)
        
        
    }
}
