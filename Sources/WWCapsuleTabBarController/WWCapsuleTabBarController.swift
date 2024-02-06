//
//  WWCapsuleTabBarController.swift
//  Example
//
//  Created by William.Weng on 2024/2/5.
//

import UIKit
import WWPrint

// MARK: WWTabBarController
open class WWCapsuleTabBarController: UITabBarController {
    
    private var tabBarView: WWTabBarView?
    private weak var myDelegate: WWCapsuleTabBarControllerDelegate?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        initTabBarItemSetting()
    }
    
    @objc func didSelectedTab(_ tapGesture: UITapGestureRecognizer) {
        didSelectedTabAction(with: tapGesture)
    }
}

// MARK: - typealias
public extension WWCapsuleTabBarController {
    
    typealias TabBarIcon = (normal: UIImage?, selected: UIImage?)    // 圖示 - (沒選到/ 有選到)
    typealias TabBarColor = (normal: UIColor?, selected: UIColor?)   // Label顏色 - (沒選到/ 有選到)
    typealias TabBarTitle = (normal: String?, selected: String?)     // Label文字 - (沒選到/ 有選到)
    typealias TabBarFont = (normal: UIFont?, selected: UIFont?)      // Label顏色 - (沒選到/ 有選到)
}

// MARK: - 公開函式
public extension WWCapsuleTabBarController {
    
    /// 設定WWCapsuleTabBarControllerDelegate
    /// - Parameter myDelegate: WWCapsuleTabBarControllerDelegate?
    func myDelegateSetting(_ myDelegate: WWCapsuleTabBarControllerDelegate?) {
        self.myDelegate = myDelegate
        configure(for: 0)
    }
    
    /// 顏色 / 文字設定 for selectedIndex
    /// - Parameter selectedIndex: Int
    func configure(withIndex selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        configure(for: selectedIndex)
        myDelegate?.didSelectedTab(self, index: selectedIndex)
    }
    
    /// 隱藏 / 顯示自訂TabBar
    /// - Parameters:
    ///   - isHidden: Bool
    ///   - duration: TimeInterval
    func hidden(_ isHidden: Bool = true, duration: TimeInterval = 0.25) {
        
        let size = tabBar.frame.size
        var point = tabBar.frame.origin
        
        if (isHidden) { point = CGPoint(x: point.x, y: point.y + size.height) }
        
        UIView.animate(withDuration: duration) { self.tabBarView?.frame = CGRect(origin: point, size: size) }
    }
}

// MARK: 小工具
private extension WWCapsuleTabBarController {
    
    /// 初始化設定自訂的長相
    func initTabBarItemSetting() {
        
        guard let tabBarView = tabBarViewMaker(),
              let maskLayer = tabBarViewMaskLayerMaker(tabBarView)
        else {
            return
        }
        
        self.tabBarView = tabBarView
        tabBarView.layer.mask = maskLayer
        tabBar.isHidden = true
        view.insertSubview(tabBarView, at: 1)
    }
    
    /// 產生WWTabBarView
    /// - Returns: WWTabBarView?
    func tabBarViewMaker() -> WWTabBarView? {
        
        guard let tabBarItems = viewControllers,
              !tabBarItems.isEmpty,
              let tabBarView = Optional.some(WWTabBarView(frame: tabBar.frame))
        else {
            return nil
        }
        
        for index in 0..<tabBarItems.count {
            
            let itemView = WWTabbarItemView()
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Self.didSelectedTab(_:)))
            
            itemView.tag = index
            itemView.frame = .zero
            itemView.isUserInteractionEnabled = true
            itemView.addGestureRecognizer(tapGestureRecognizer)
            
            tabBarView.stackView.addArrangedSubview(itemView)
        }
        
        return tabBarView
    }
    
    /// 產生膠囊型的MaskLayer
    /// - Parameter tabBarView: WWTabBarView?
    /// - Returns: CAShapeLayer?
    func tabBarViewMaskLayerMaker(_ tabBarView: WWTabBarView?) -> CAShapeLayer? {
        
        guard let tabBarView = tabBarView else { return nil }
        
        let maskLayer = CAShapeLayer()
        let size = tabBarView.frame.size
        let tap = tabBarView.stackView.frame.minX
        let layerSize = CGSize(width: size.width - tap * 2, height: size.height - tap * 2)
        let layerPath = UIBezierPath._capsule(CGRect(origin: CGPoint(x: tap, y: tap), size: layerSize))
        
        maskLayer.path = layerPath.cgPath
        return maskLayer
    }
    
    /// 點到ItemTab時要處理的事
    /// - Parameter tapGesture: UITapGestureRecognizer
    func didSelectedTabAction(with tapGesture: UITapGestureRecognizer) {
        
        guard let selectedIndex = tapGesture.view?.tag,
              self.selectedIndex != selectedIndex
        else {
            return
        }
        
        configure(withIndex: selectedIndex)
    }
    
    /// 顏色 / 文字設定
    /// - Parameter selectedIndex: Int
    func configure(for selectedIndex: Int) {
        
        guard let itemViewArray = tabBarView?.stackView.subviews as? [WWTabbarItemView] else { return }
        
        configureView(for: selectedIndex)
        configureItems(itemViewArray: itemViewArray, for: selectedIndex)
    }
    
    /// 設定主畫面長相
    /// - Parameter selectedIndex: Int
    func configureView(for selectedIndex: Int) {
        
        if let backgroundColor = myDelegate?.backgroundColors(self)?[safe: selectedIndex] { tabBarView?.backgroundColor = backgroundColor }
        if let backgroundImage = myDelegate?.backgroundImages(self)?[safe: selectedIndex] { tabBarView?.imageView.image = backgroundImage }
    }
    
    /// 設定TabItem的長相
    /// - Parameters:
    ///   - itemViewArray: [WWTabbarItemView]
    ///   - selectedIndex: Int
    func configureItems(itemViewArray: [WWTabbarItemView], for selectedIndex: Int) {
        
        for (index, itemView) in itemViewArray.enumerated() {
            
            if let icon = myDelegate?.itemIcons(self)[safe: index] {
                itemView.iconImageView.image = (selectedIndex != index) ? icon.normal : icon.selected
            }
            
            if let backgroundColor = myDelegate?.itemBackgroundColors(self)[safe: index] {
                itemView.backgroundColor = (selectedIndex != index) ? backgroundColor.normal : backgroundColor.selected
            }
            
            if let titleColor = myDelegate?.itemTitleColors(self)[safe: index] {
                itemView.titleLabel.textColor = (selectedIndex != index) ? titleColor.normal : titleColor.selected
            }
            
            if let font = myDelegate?.itemTitleFonts(self)[safe: index] {
                itemView.titleLabel.font = (selectedIndex != index) ? font.normal : font.selected
            }
            
            if let title = myDelegate?.itemTitles(self)[safe: index] {
                itemView.titleLabel.text = (selectedIndex != index) ? title.normal : title.selected
                itemView.imageCenterYConstraint.constant = (itemView.titleLabel.text != nil) ? -10 : 4
            }
        }
    }
}
