//
//  WWTabBar.swift
//  Example
//
//  Created by William.Weng on 2024/2/5.
//

import UIKit

/// 自定義的TabBar
final class WWTabBar: UITabBar {
    
    @IBInspectable var height: Double = 96
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        return customHeight(size: size)
    }
}

// MARK: - 小工具
private extension WWTabBar {
    
    func customHeight(size: CGSize) -> CGSize {
       
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = height
        
        return sizeThatFits
    }
}
