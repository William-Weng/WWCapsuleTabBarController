//
//  WWTabBar.swift
//  WWCapsuleTabBarController
//
//  Created by William.Weng on 2024/2/5.
//

import UIKit

/// 自定義的TabBar
final class WWTabBar: UITabBar {
    
    @IBInspectable var portraitHeight: Double = 84
    @IBInspectable var landscapeHeight: Double = 48
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        return customHeight(size: size)
    }
}

// MARK: - 小工具
private extension WWTabBar {
    
    /// 自訂高度 (橫放 / 直放)
    /// - Parameter size: CGSize
    /// - Returns: CGSize
    func customHeight(size: CGSize) -> CGSize {
        
        let height = (frame.origin.y > frame.size.width) ? portraitHeight : landscapeHeight
        var sizeThatFits = super.sizeThatFits(size)
        
        sizeThatFits.height = height
        return sizeThatFits
    }
}
