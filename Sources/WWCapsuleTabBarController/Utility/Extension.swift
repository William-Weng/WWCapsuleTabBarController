//
//  Extension.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit

// MARK: - Collection (override function)
extension Collection {
    
    /// [為Array加上安全取值特性 => nil](https://stackoverflow.com/questions/25329186/safe-bounds-checked-array-lookup-in-swift-through-optional-bindings)
    subscript(safe index: Index) -> Element? { return indices.contains(index) ? self[index] : nil }
}

// MARK: - UIBezierPath (static function)
extension UIBezierPath {
    
    /// 繪出膠囊的外形曲線 (感謝ChatGPT)
    /// - Parameter rect: CGRect
    /// - Returns: UIBezierPath
    static func _capsule(_ rect: CGRect) -> UIBezierPath {
        
        let path = UIBezierPath()
        let startPoint = CGPoint(x: rect.minX + rect.height * 0.5, y: rect.minY)
        let radius = rect.height * 0.5
        let startAngle = CGFloat(-Double.pi * 0.5)
        let endAngle = CGFloat(Double.pi * 0.5)
        
        path.move(to: startPoint)
        path.addArc(withCenter: CGPoint(x: rect.maxX - rect.height * 0.5, y: rect.midY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addArc(withCenter: CGPoint(x: rect.minX + rect.height * 0.5, y: rect.midY), radius: radius, startAngle: endAngle, endAngle: startAngle, clockwise: true)
        path.close()
        
        return path
    }
}
