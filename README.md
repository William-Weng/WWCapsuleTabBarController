# WWCapsuleTabBarController
[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWCapsuleTabBarController) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

## [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- Based on UITabBarController, implement a TabBarController that can display more than six Tabs.
- 基於UITabBarController，實現能顯示六個以上Tab的TabBarController。

![](./Example.gif)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```js
dependencies: [
    .package(url: "https://github.com/William-Weng/WWCapsuleTabBarController.git", .upToNextMajor(from: "1.2.0"))
]
```

### WWCapsuleTabBarControllerDelegate

|函式|功能|
|-|-|
|didSelectedTab(_:withIndex:)|選到的分頁Tab的index|
|backgroundSetting(_:withIndex:)|選到的分頁Tab的整體背景相關設定|
|itemSetting(_:withIndex:)|分頁Item的相關設定|
|itemTitleSetting(_:withIndex:)|分頁Item文字相關設定|

### Function - 可用函式
|函式|功能|
|-|-|
|myDelegateSetting(_:useAnimation:)|設定WWCapsuleTabBarControllerDelegate|
|configure(withIndex:)|顏色 / 文字設定 for selectedIndex|
|hidden(_:duration:)|隱藏 / 顯示自訂TabBar|

### Setting - 相關設定
- The homepage should inherit WWCapsuleTabBarController.
- 首頁要繼承WWCapsuleTabBarController。

![](./Example.png)

### Example - 範例
```swift
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
```
```swift
import UIKit
import WWPrint
import WWCapsuleTabBarController

final class Tab6ViewController: WWTabBarRootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
```
