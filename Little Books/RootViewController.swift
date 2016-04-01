//
//  RootViewController.swift
//  Little Books
//
//  Created by Winson Lim on 27/2/16.
//  Copyright © 2016 Tigerspike. All rights reserved.
//

import UIKit
import ECSlidingViewController

class RootViewController: UIViewController, ECSlidingViewControllerDelegate {
    
    @IBOutlet weak var naviItem: UINavigationItem!
    let mainColor      = UIColor(hex: 0x804C5F)
//    let derivatedColor = UIColor(hex: 0x794759)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dashboard"
        
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.tintColor = .whiteColor()
        navigationController?.navigationBar.barTintColor = mainColor
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 22)!,
            NSForegroundColorAttributeName: UIColor.whiteColor()]
//        view.backgroundColor = mainColor
    }
    
    @IBAction func menuPressed(sender: AnyObject) {
        self.slidingViewController().anchorTopViewToRightAnimated(true)
    }
    
    // MARK: - Interacting with Storyboards and Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PresentMenuSegue" {
            
        }
    }
    
    
    // MARK: - Managing the Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}

