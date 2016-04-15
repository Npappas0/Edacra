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
    var selecterNum = 0
    var yes = true
    
    @IBOutlet weak var startImage: UIImageView!
    
    @IBOutlet weak var quitImage: UIImageView!
    
    override func viewDidLoad()
    {
        looping()
        startImage.image = UIImage(named: "StartButton")
        quitImage.image = UIImage(named: "quit")
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
       
        
    }
    ///EndViewDidLoad
    
    @IBAction func enterButton(sender: AnyObject) {
        if yes == true{
            selecterNum = selecterNum + 1
            startImage.image = UIImage(named: "StartButton")
            yes = false
            loopCounter = 0
        }
        else {
            selecterNum = selecterNum - 1
             quitImage.image = UIImage(named: "quit")
            yes = true
            loopCounter = 0
        }
    }
    
    
    func looping(){
    loopTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "jiffing", userInfo: nil, repeats: true)
    }
    
    func jiffing() {
        if selecterNum == 0
    {
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
            startImage.image = UIImage(named: "StartButton12")
               loopCounter = loopCounter + 1
        }
            else if loopCounter == 3 {
            startImage.image = UIImage(named: "StartButton2")
                loopCounter = loopCounter + 1
        }
            else if loopCounter == 4 {
                startImage.image = UIImage(named: "StartButton12")
                loopCounter = loopCounter + 1
        }
            else if loopCounter == 5 {
                startImage.image = UIImage(named: "StartButton1")
                loopCounter = 0
        
        }
        
        }
        else if selecterNum == 1
        {
            if loopCounter == 0 {
                quitImage.image = UIImage(named: "quit")
                loopCounter = loopCounter + 1
            }
            else if loopCounter == 1
            {
                quitImage.image = UIImage(named: "quit1")
                loopCounter = loopCounter + 1
            }
            else if loopCounter == 2 {
                quitImage.image = UIImage(named: "quit2")
                loopCounter = loopCounter + 1
            }
            else if loopCounter == 3 {
                quitImage.image = UIImage(named: "quit3")
                loopCounter = loopCounter + 1
            }
            else if loopCounter == 4 {
                quitImage.image = UIImage(named: "quit2")
                loopCounter = loopCounter + 1
            }
            else if loopCounter == 5
            {
                quitImage.image = UIImage(named: "quit1")
                loopCounter = 0
            }
        }
       
     
       
        
        
        
    }
    

}
