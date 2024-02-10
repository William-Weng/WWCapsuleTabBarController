//
//  Protocol.swift
//  WWCapsuleTabBarController
//
//  Created by William.Weng on 2024/2/6.
//

import UIKit

// MARK: - WWCapsuleTabBarControllerDelegate
public protocol WWCapsuleTabBarControllerDelegate: AnyObject {
    
    func didSelectedTab(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int)
    func backgroundSetting(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarBackground?
    func itemSetting(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarItem?
    func itemTitleSetting(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarTitle?
}
