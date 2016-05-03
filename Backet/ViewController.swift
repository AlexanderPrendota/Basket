//
//  ViewController.swift
//  Backet
//
//  Created by Александр Прендота on 02.05.16.
//  Copyright © 2016 Александр Прендота. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var testlabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        begin.alpha = 0.0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.begin.alpha = 1
            }, completion: nil)        
    }
    
    @IBOutlet weak var begin: UIButton!
    @IBAction func beginButton(sender: UIButton) {
        buttonAnimation(begin)
        let alert = UIAlertController(title: "Basket", message: "Поехали?", preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.Cancel, handler: nil)
        let buttonOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
        self.performSegueWithIdentifier("getGame", sender: sender)
        }
      
        alert.addAction(buttonOK)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    // Анимация трясущейся кнопки. 
    func buttonAnimation(button : UIButton) {
        let bounds = button.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {
            button.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            //self.contin.enabled = false
            }, completion: nil)
        
    }
    

}
