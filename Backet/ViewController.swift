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
    
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!

    
    private var isLeft = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
          NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(updateSteps(_:)), userInfo: nil, repeats: true)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
        self.performSegueWithIdentifier("getGame", sender: sender)
    }

    // Анимация трясущейся кнопки. 
    func buttonAnimation(button : UIButton) {
        let bounds = button.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {
            button.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            //self.contin.enabled = false
            }, completion: nil)
        
    }
    
    func updateSteps(timer: NSTimer) {
        if isLeft {
            rightConstraint.constant = leftConstraint.constant + 20
        } else {
            leftConstraint.constant = rightConstraint.constant + 20
        }
        
//        if leftConstraint.constant > view.frame.height || rightConstraint.constant > view.frame.height {
//            timer.invalidate()
//        }
//        
        isLeft = !isLeft
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
        }
    }
    

}
