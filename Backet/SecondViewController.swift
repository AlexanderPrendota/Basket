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
    @IBAction func finalButton(sender: UIButton) {
         self.performSegueWithIdentifier("getFinal", sender: sender)
    }
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var finalBut: UIButton!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        finalBut.hidden = true
        countAll = NSUserDefaults.standardUserDefaults().integerForKey("launchCount")
        
        if countAll == 0 {
            countAll = 100
        }
        
        countLabel.text = "\(countAll)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if countAll == 750 {
            countAll -= 1
            self.imageMain.image = UIImage(named: "nope.jpg")
        } else if countAll == 745 {
            finalBut.hidden = false
            countLabel.text = "вин"
        } else {
        countAll -= 1
        countLabel.text = "\(countAll)"
            
        let bounds = imageMain.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {
            self.imageMain.bounds = CGRect(x: bounds.origin.x - 10, y: bounds.origin.y, width: bounds.size.width + 50,height: bounds.size.height)
            }, completion: nil)
        }
     
      
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(countAll, forKey: "launchCount")
        userDefaults.synchronize()
        

    }

    @IBAction func returnButton(sender: UIButton) {
     
    }
}
