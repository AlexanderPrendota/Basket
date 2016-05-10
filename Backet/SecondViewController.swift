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
    let imageDicAnimation : [Int : String] = [0 : "мяу1", 1 : "мяу2", 2 : "мяу3"]


    @IBOutlet weak var imageMain: UIImageView!
    @IBAction func finalButton(sender: UIButton) {
         self.performSegueWithIdentifier("getFinal", sender: sender)
    }
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var finalBut: UIButton!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         self.imageMain.image = UIImage(named: "kit.jpg")
        
        finalBut.hidden = true
        countAll = NSUserDefaults.standardUserDefaults().integerForKey("launchCount")
        
        if countAll == 0 {
            self.countLabel.text = "Победа."
            self.imageMain.image = UIImage(named: "win.jpg")
        }
        
        if  Int(countLabel.text!) <= 9{
            self.imageMain.image = UIImage(named: "nope.jpg")
        } else if Int(countLabel.text!) <= 7 {
           self.imageMain.image = UIImage(named: "n1")
        } else if Int(countLabel.text!) <= 5 {
           self.imageMain.image = UIImage(named: "n2")
        } else if Int(countLabel.text!) <= 3 {
            self.imageMain.image = UIImage(named: "n3.jpg")
        } else if Int(countLabel.text!) <= 1 {
            self.imageMain.image = UIImage(named: "n4")
        } else {
             self.imageMain.image = UIImage(named: "kit.jpg")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            
            if countAll == 9 {
                countAll -= 1
                self.imageMain.image = UIImage(named: "nope.jpg")
                self.countLabel.text = "\(countAll)"
            } else if countAll == 7 {
                countAll -= 1
                self.imageMain.image = UIImage(named: "n1")
                self.countLabel.text = "\(countAll)"
            } else if countAll == 5 {
                countAll -= 1
                self.imageMain.image = UIImage(named: "n2")
                self.countLabel.text = "\(countAll)"
            } else if countAll == 3 {
                countAll -= 1
                self.imageMain.image = UIImage(named: "n3.jpg")
                self.countLabel.text = "\(countAll)"
            } else if countAll == 1 {
                countAll -= 1
                self.imageMain.image = UIImage(named: "n4")
                countLabel.text = "\(countAll)"
            } else if countAll == 0 {
                self.imageMain.image = UIImage(named: "win.jpg")
                self.finalBut.hidden = false
                self.countLabel.text = "Ура! Котик вышел!"
            } else {
                countAll -= 1
                self.countLabel.text = "\(countAll)"
            }
        
             
            // Анимация шатающийся картинки
            let bounds = imageMain.bounds
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {
            self.imageMain.bounds = CGRect(x: bounds.origin.x - 10, y: bounds.origin.y, width: bounds.size.width + 50,height: bounds.size.height)
            }, completion: nil)
            
            // Анимация выплывающих иконок
            
            let size:CGFloat = CGFloat(arc4random_uniform(50))+10 //Размер объекта от 10 до 60
            let centerX:CGFloat = CGRectGetMidX(self.view.frame) //Центр по X
            let centerY:CGFloat = CGFloat(arc4random_uniform(UInt32(CGRectGetMidY(self.view.frame)))) + 50 //Случайное числа по оси Y между 50 и центр+50.
            
            // Создаем ноту и добавляем ее на экран
            let AnimationView = UIImageView()
            AnimationView.image = UIImage(named: self.imageDicAnimation[Int(arc4random_uniform(3))]! ?? "мяу4.png")
            AnimationView.frame = CGRectMake(0 - size, centerY - size, size, size)
            self.view.addSubview(AnimationView)
            
            let duration = 2.0
            let delay = NSTimeInterval(arc4random_uniform(1000)) / 1000 // Задержка от 0 до 1 секунд
            let options = UIViewAnimationOptions.CurveLinear
            UIView.animateWithDuration(duration, delay:delay, options:options, animations: {
                
                AnimationView.frame = CGRectMake(2 * centerX, centerY-size, size, size)
                }, completion: { animationFinished in AnimationView.removeFromSuperview() } )
            
            
        
      //  Для обновления счетчика.
//        let count = 10
//        countLabel.text = "\(count)"
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(countAll, forKey: "launchCount")
        userDefaults.synchronize()
        

    }

    @IBAction func returnButton(sender: UIButton) {
       // self.performSegueWithIdentifier("getMain", sender: sender)
        self.dismissViewControllerAnimated(false, completion: nil)
    }

}