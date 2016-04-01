//
//  KidsAddViewController.swift
//  Little Books
//
//  Created by Winson Lim on 2/4/16.
//  Copyright © 2016 Tigerspike. All rights reserved.
//

import UIKit

class KidsAddViewController: UIViewController {

    let derivatedColor = UIColor(hex: 0x794759)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 22)!,
            NSForegroundColorAttributeName: derivatedColor]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savePressed(sender: AnyObject) {
        
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
