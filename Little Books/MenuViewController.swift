//
//  MenuViewController.swift
//
//  Created by Yannick LORIOT on 03/12/15.
//  Copyright © 2015 Yannick LORIOT. All rights reserved.
//

import UIKit
import ECSlidingViewController

final class MenuViewController: UITableViewController {
    
    @IBOutlet weak var dashboardCell: UITableViewCell!
    
    @IBOutlet weak var kidsCell: UITableViewCell!
    @IBOutlet weak var booksCell: UITableViewCell!
    
//    let mainColor = UIColor(hex: 0xC4ABAA)
    
    var transitionsNavigationController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // topViewController is the transitions navigation controller at this point.
        // It is initially set as a User Defined Runtime Attributes in storyboards.
        // We keep a reference to this instance so that we can go back to it without losing its state.
        self.transitionsNavigationController = self.slidingViewController().topViewController as! UINavigationController
        
        // Setting of menu cell colours
//        dashboardCell.backgroundColor = mainColor
//        booksCell.backgroundColor = mainColor
//        kidsCell.backgroundColor = mainColor
//        view.backgroundColor = mainColor
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.slidingViewController().topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        let cellClicked = tableView.cellForRowAtIndexPath(indexPath)
        
        if (cellClicked == dashboardCell) {
            self.slidingViewController().topViewController = self.transitionsNavigationController;
        } else if (cellClicked == kidsCell) {
              self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("KidsVC")
        } else if (cellClicked  == booksCell) {
            self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BooksVC")
        }
        
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    // MARK: - Managing the Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}
