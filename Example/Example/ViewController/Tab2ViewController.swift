//
//  Tab2ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit
import WWPrint
import WWCapsuleTabBarController

final class Tab2ViewController: WWTabBarRootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func hiddenTabar(_ sender: UIBarButtonItem) { displayTabBar(isHedden: true) }
    @IBAction func displayTabar(_ sender: UIBarButtonItem) { displayTabBar(isHedden: false) }
}

// MARK: - 小工具
private extension Tab2ViewController {
    
    /// 隱藏 / 顯示WWTabBarController
    /// - Parameter isHedden: Bool
    func displayTabBar(isHedden: Bool) {
        guard let tabBarController = tabBarController as? WWCapsuleTabBarController else { return }
        tabBarController.hidden(isHedden)
    }
}
