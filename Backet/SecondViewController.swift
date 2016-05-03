//
//  SecondViewController.swift
//  Backet
//
//  Created by Александр Прендота on 02.05.16.
//  Copyright © 2016 Александр Прендота. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    

    var countAll :Int = 0
    
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBAction func returnButton(sender: UIButton) {
    }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countAll = NSUserDefaults.standardUserDefaults().integerForKey("launchCount")
        
        if countAll == 0 {
            countAll = 10
        }
        
        countLabel.text = "\(countAll)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        countAll -= 1
        countLabel.text = "\(countAll)"
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(countAll, forKey: "launchCount")
        userDefaults.synchronize()
        
        let bounds = imageMain.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {
        self.imageMain.bounds = CGRect(x: bounds.origin.x - 10, y: bounds.origin.y, width: bounds.size.width + 50,height: bounds.size.height)
        }, completion: nil)
        
    }
}
