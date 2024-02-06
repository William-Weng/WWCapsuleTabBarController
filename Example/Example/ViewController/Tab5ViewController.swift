//
//  Tab6ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit
import WWPrint
import WWCapsuleTabBarController

final class Tab5ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        performSegue(withIdentifier: "NextPageSegue", sender: nil)
    }
}
