//
//  RootViewController.swift
//  Little Books
//
//  Created by Winson Lim on 27/2/16.
//  Copyright © 2016 Tigerspike. All rights reserved.
//

import UIKit
import FlowingMenu

class RootViewController: UIViewController, FlowingMenuDelegate {
    
    @IBOutlet var flowingMenuTransitionManager: FlowingMenuTransitionManager!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    var menu: UIViewController?
    
    let mainColor      = UIColor(hex: 0x804C5F)
    let derivatedColor = UIColor(hex: 0x794759)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add the pan screen edge gesture to the current view
        flowingMenuTransitionManager.setInteractivePresentationView(view)
        
        // Add the delegate to respond to interactive transition events
        flowingMenuTransitionManager.delegate = self
        
        naviBar.tintColor              = .whiteColor()
        naviBar.barTintColor           = mainColor
        naviBar.titleTextAttributes    = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 22)!,
            NSForegroundColorAttributeName: UIColor.whiteColor()]
        view.backgroundColor          = mainColor
    }
    
    // MARK: - Interacting with Storyboards and Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PresentMenuSegue" {
            let vc = segue.destinationViewController
            vc.transitioningDelegate = flowingMenuTransitionManager
            
            // Add the left pan gesture to the menu
            flowingMenuTransitionManager.setInteractiveDismissView(vc.view)
            
            // Keep a reference of the current menu
            menu = vc
        }
    }
    
    @IBAction func unwindToMainViewController(sender: UIStoryboardSegue) {
    }
    
    // MARK: - Managing the Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - FlowingMenu Delegate Methods
    
    func colorOfElasticShapeInFlowingMenu(flowingMenu: FlowingMenuTransitionManager) -> UIColor? {
        return mainColor
    }
    
    func flowingMenuNeedsPresentMenu(flowingMenu: FlowingMenuTransitionManager) {
        performSegueWithIdentifier("PresentMenuSegue", sender: self)
    }
    
    func flowingMenuNeedsDismissMenu(flowingMenu: FlowingMenuTransitionManager) {
        menu?.performSegueWithIdentifier("DismissMenuSegue", sender: self)
    }
    
}

