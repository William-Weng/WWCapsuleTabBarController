//
//  Extension.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit

// MARK: - UITableViewCell (function)
extension UITableViewCell {
    
    /// [設定內建樣式 - iOS 14](https://apppeterpan.medium.com/從-ios-15-開始-使用內建-cell-樣式建議搭配-uilistcontentconfiguration-13d64eb317be)
    /// - Parameters:
    ///   - text: 主要文字
    ///   - secondaryText: 次要文字
    ///   - image: 圖示
    func _contentConfiguration(text: String?, secondaryText: String?, image: UIImage?) {
        
        var config = defaultContentConfiguration()
        
        config.text = text
        config.secondaryText = secondaryText
        config.image = image
        
        contentConfiguration = config
    }
}
