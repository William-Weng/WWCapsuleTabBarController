//
//  Protocol.swift
//  
//
//  Created by William.Weng on 2024/2/6.
//

import UIKit

// MARK: - WWCapsuleTabBarControllerDelegate
public protocol WWCapsuleTabBarControllerDelegate: AnyObject {
    
    func didSelectedTab(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int)
    func backgroundImages(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> UIImage?
    func backgroundColors(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> UIColor?
    func itemIcons(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarIcon?
    func itemBackgroundColors(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarColor?
    func itemTitles(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarTitle?
    func itemTitleColors(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarColor?
    func itemTitleFonts(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarFont?
}
