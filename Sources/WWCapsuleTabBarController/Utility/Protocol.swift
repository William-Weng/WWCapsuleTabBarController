//
//  Protocol.swift
//  
//
//  Created by William.Weng on 2024/2/6.
//

import UIKit

// MARK: - WWCapsuleTabBarControllerDelegate
public protocol WWCapsuleTabBarControllerDelegate: AnyObject {
    
    func didSelectedTab(_ tabBarController: WWCapsuleTabBarController, index: Int)
    func backgroundImages(_ tabBarController: WWCapsuleTabBarController) -> [UIImage?]?
    func backgroundColors(_ tabBarController: WWCapsuleTabBarController) -> [UIColor?]?
    func itemIcons(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarIcon]
    func itemBackgroundColors(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarColor]
    func itemTitles(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarTitle]
    func itemTitleColors(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarColor]
    func itemTitleFonts(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarFont]
}
