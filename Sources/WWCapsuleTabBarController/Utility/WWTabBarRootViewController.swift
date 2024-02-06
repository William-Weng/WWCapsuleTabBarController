//
//  WWTabBarRootViewController.swift
//  WWTabBarController
//
//  Created by William.Weng on 2024/2/5.
//

import UIKit

/// Tab首頁的基本UIViewController
open class WWTabBarRootViewController: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        fixMoreNavigationController()
    }
}

// MARK: - 小工具
private extension WWTabBarRootViewController {
    
    /// [修正moreNavigationController的問題](https://developer.apple.com/documentation/uikit/uitabbarcontroller/1621183-morenavigationcontroller)
    func fixMoreNavigationController() {
        
        guard navigationController?.viewControllers.count == 2,
              let rootViewController = navigationController?.viewControllers.last
        else {
            return
        }

        navigationController?.viewControllers = [rootViewController]
    }
}
