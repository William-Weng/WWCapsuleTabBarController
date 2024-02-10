//
//  WWTabBarItemView.swift
//  WWCapsuleTabBarController
//
//  Created by William.Weng on 2024/2/5.
//

import UIKit
import WWPrint

/// 自定義WWTabBarItemView
final class WWTabBarItemView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelCenterYConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViewFromXib()
    }
    
    deinit { wwPrint("\(Self.self) deinit") }
}

// MARK: - 小工具
private extension WWTabBarItemView {
    
    /// 載入XIB的一些基本設定
    func initViewFromXib() {
        
        let xibName = String(describing: Self.self)
        let bundle = Bundle.module
        
        bundle.loadNibNamed(xibName, owner: self, options: nil)
        view.frame = bounds
        addSubview(view)
    }
}
