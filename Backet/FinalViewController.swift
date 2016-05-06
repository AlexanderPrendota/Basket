//
//  FinalViewController.swift
//  Backet
//
//  Created by Александр Прендота on 05.05.16.
//  Copyright © 2016 Александр Прендота. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var finalTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalTextView.backgroundColor = UIColor(red: 124/255, green: 118/255, blue: 118/255, alpha: 0.8)
        finalTextView.font = UIFont(name: "Apple Color Emoji", size: 15)
        finalTextView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
