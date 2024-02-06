//
//  MyTabBarController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit
import WWCapsuleTabBarController
import WWPrint

final class MyTabBarController: WWCapsuleTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
    }
}

// MARK: - WWCapsuleTabBarControllerDelegate
extension MyTabBarController: WWCapsuleTabBarControllerDelegate {
    
    func didSelectedTab(_ tabBarController: WWCapsuleTabBarController, index: Int) {
        wwPrint(index)
    }
    
    func backgroundImages(_ tabBarController: WWCapsuleTabBarController) -> [UIImage?]? {
        
        let images = [
            UIImage(named: "Green"),
            UIImage(named: "Yellow"),
            UIImage(named: "Blue"),
            UIImage(named: "Green"),
            UIImage(named: "Yellow"),
            UIImage(named: "Blue"),
        ]
        
        return images
    }
    
    func backgroundColors(_ tabBarController: WWCapsuleTabBarController) -> [UIColor?]? {
        
        let colors: [UIColor?] = [
            .black.withAlphaComponent(0.3),
            .systemPink,
            .gray.withAlphaComponent(0.7),
            .blue.withAlphaComponent(0.1),
            .magenta.withAlphaComponent(0.5),
            .black.withAlphaComponent(0.8),
        ]
        
        return colors
    }
    
    func itemIcons(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarIcon] {
        
        let icons: [WWCapsuleTabBarController.TabBarIcon] = [
            (normal: UIImage(systemName: "square.and.arrow.up"), selected: nil),
            (normal: UIImage(systemName: "folder.fill"), selected: nil),
            (normal: UIImage(systemName: "book.fill"), selected: nil),
            (normal: UIImage(systemName: "pencil.circle"), selected: UIImage(systemName: "pencil.circle.fill")),
            (normal: UIImage(systemName: "folder.badge.person.crop"), selected: UIImage(systemName: "folder.fill.badge.person.crop")),
            (normal: UIImage(systemName: "trash"), selected: UIImage(systemName: "trash.fill")),
        ]
        
        return icons
    }
    
    func itemBackgroundColors(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarColor] {
        
        let colors: [WWCapsuleTabBarController.TabBarColor] = [
            (normal: .clear, selected: .red),
            (normal: .clear, selected: .blue),
            (normal: .clear, selected: .brown),
            (normal: .darkGray, selected: .systemPink),
            (normal: .systemGreen, selected: .blue),
            (normal: .clear, selected: .magenta),
        ]
        
        return colors
    }
    
    func itemTitles(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarTitle] {
        
        let titles: [WWCapsuleTabBarController.TabBarTitle] = [
            (normal: nil, selected: "主頁"),
            (normal: nil, selected: "分類"),
            (normal: "", selected: "項目"),
            (normal: "", selected: "資訊"),
            (normal: "Setting", selected: "設定"),
            (normal: "My", selected: "我的"),
        ]
        
        return titles
    }
    
    func itemTitleColors(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarColor] {
        
        let colors: [TabBarColor] = [
            (normal: .clear, selected: .white),
            (normal: .clear, selected: .white),
            (normal: .clear, selected: .white),
            (normal: .white, selected: .green),
            (normal: .white, selected: .magenta),
            (normal: .white, selected: .yellow),
        ]
        
        return colors
    }
    
    func itemTitleFonts(_ tabBarController: WWCapsuleTabBarController) -> [WWCapsuleTabBarController.TabBarFont] {
        
        let fonts: [WWCapsuleTabBarController.TabBarFont] = [
            (normal: .systemFont(ofSize: 16, weight: .black), selected: nil),
            (normal: .systemFont(ofSize: 20, weight: .black), selected: nil),
            (normal: nil, selected: .boldSystemFont(ofSize: 16)),
            (normal: nil, selected: .boldSystemFont(ofSize: 16)),
            (normal: .italicSystemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 16)),
            (normal: .italicSystemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 16)),
        ]
        
        return fonts
    }
}

// MARK: - 小工具
private extension MyTabBarController {
    
    /// 初始化
    func initSetting() { self.myDelegateSetting(self) }
}
