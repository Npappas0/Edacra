//
//  MenuViewController.swift
//  Edacra
//
//  Created by NPappas on 4/7/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController
{

    var loopTimer = NSTimer()
    var loopCounter = 0
    @IBOutlet weak var startImage: UIImageView!
    
    
    override func viewDidLoad()
    {
        looping()
        startImage.image = UIImage(named: "StartButton")
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
       
        
    }
    func looping(){
    loopTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "jiffing", userInfo: nil, repeats: true)
    }
    
    func jiffing() {
        if loopCounter == 0 {
        startImage.image = UIImage(named: "StartButton")
               loopCounter = loopCounter + 1
        }
        else if loopCounter == 1
        {
            startImage.image = UIImage(named: "StartButton1")
               loopCounter = loopCounter + 1
        }
        else if loopCounter == 2 {
            startImage.image = UIImage(named: "StartButton2")
               loopCounter = loopCounter + 1
        }
        else if loopCounter == 3 {
            startImage.image = UIImage(named: "StartButton1")
                loopCounter = 0
        }
       
     
       
        
        
        
    }
    

}
