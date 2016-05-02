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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let background = UIImage(named: "bg1")
        self.view.backgroundColor = UIColor(patternImage: background!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        contin.alpha = 0.0
        begin.alpha = 0.0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.contin.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.begin.alpha = 1
            }, completion: nil)
        
    }
    
    @IBOutlet weak var begin: UIButton!
    @IBAction func beginButton(sender: UIButton) {
        buttonAnimation(begin)
    }
    
    @IBOutlet weak var contin: UIButton!
    @IBAction func continueButton(sender: UIButton) {
        buttonAnimation(contin)
        
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
