//
//  SecondViewController.swift
//  Backet
//
//  Created by Александр Прендота on 02.05.16.
//  Copyright © 2016 Александр Прендота. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageMain: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Уменьшаем счетчик по нажатию на любую область экрана
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let count = Int(countLabel.text!)! - 1
        countLabel.text = String(count)
        
        let bounds = imageMain.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {
            self.imageMain.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            //self.contin.enabled = false
            }, completion: nil)
    }
}
