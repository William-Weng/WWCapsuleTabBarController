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
    
    func didSelectedTab(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) {
        wwPrint(index)
    }
    
    func backgroundSetting(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarBackground? {
        
        let settings: [WWCapsuleTabBarController.TabBarBackground] = [
            (image: UIImage(named: "Green"), color: .black.withAlphaComponent(0.3), alpha: 1.0),
            (image: UIImage(named: "Yellow"), color: .systemPink, alpha: 0.8),
            (image: UIImage(named: "Blue"), color: .gray.withAlphaComponent(0.7), alpha: 0.6),
            (image: UIImage(named: "Green"), color: .blue.withAlphaComponent(0.1), alpha: 0.4),
            (image: UIImage(named: "Yellow"), color: .magenta.withAlphaComponent(0.5), alpha: 0.2),
            (image: UIImage(named: "Blue"), color: .black.withAlphaComponent(0.8), alpha: 0.0),
        ]
        
        return settings[safe: index]
    }
    
    func itemSetting(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarItem? {
        
        let settings: [WWCapsuleTabBarController.TabBarItem] = [
            (icon: (normal: UIImage(systemName: "square.and.arrow.up"), selected: nil), color: (normal: .clear, selected: .red)),
            (icon: (normal: UIImage(systemName: "folder.fill"), selected: nil), color: (normal: .clear, selected: .blue)),
            (icon: (normal: UIImage(systemName: "book.fill"), selected: nil), color: (normal: .clear, selected: .brown)),
            (icon: (normal: UIImage(systemName: "pencil.circle"), selected: UIImage(systemName: "pencil.circle.fill")), color: (normal: .darkGray, selected: .systemPink)),
            (icon: (normal: UIImage(systemName: "folder.badge.person.crop"), selected: UIImage(systemName: "folder.fill.badge.person.crop")), color: (normal: .systemGreen, selected: .blue)),
            (icon: (normal: UIImage(systemName: "trash"), selected: UIImage(systemName: "trash.fill")), color: (normal: .clear, selected: .magenta)),
        ]
        
        return settings[safe: index]
    }
    
    func itemTitleSetting(_ tabBarController: WWCapsuleTabBarController, withIndex index: Int) -> WWCapsuleTabBarController.TabBarTitle? {
        
        let settings: [WWCapsuleTabBarController.TabBarTitle] = [
            (text: (normal: nil, selected: "主頁"), font: (normal: .systemFont(ofSize: 16, weight: .black), selected: nil), color: (normal: .clear, selected: .white)),
            (text: (normal: nil, selected: "分類"), font:  (normal: .systemFont(ofSize: 20, weight: .black), selected: nil), color: (normal: .clear, selected: .white)),
            (text: (normal: "", selected: "項目"), font: (normal: nil, selected: .boldSystemFont(ofSize: 16)), color: (normal: .clear, selected: .white)),
            (text: (normal: "", selected: "資訊"), font: (normal: nil, selected: .boldSystemFont(ofSize: 16)), color: (normal: .white, selected: .green)),
            (text: (normal: "Setting", selected: "設定"), font: (normal: .italicSystemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 16)), color: (normal: .white, selected: .magenta)),
            (text: (normal: "My", selected: "我的"), font: (normal: .italicSystemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 16)), color: (normal: .white, selected: .yellow)),
        ]
        
        return settings[safe: index]
    }
}

// MARK: - 小工具
private extension MyTabBarController {
    
    /// 初始化
    func initSetting() { self.myDelegateSetting(self) }
}
