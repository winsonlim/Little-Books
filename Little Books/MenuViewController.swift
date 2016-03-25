//
//  MenuViewController.swift
//  FlowingMenuExample
//
//  Created by Yannick LORIOT on 03/12/15.
//  Copyright © 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {
    
    @IBOutlet weak var navibar: UINavigationBar!
    
    let mainColor = UIColor(hex: 0xC4ABAA)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navibar.tintColor              = .blackColor()
        navibar.barTintColor           = mainColor
        navibar.titleTextAttributes    = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 22)!,
            NSForegroundColorAttributeName: UIColor.blackColor()]
        
        view.backgroundColor          = mainColor
    }
    
    // MARK: - Managing the Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}
