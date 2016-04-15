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
    
    @IBOutlet weak var startImage: UIImageView!
    
    
    override func viewDidLoad()
    {
        looping()
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        startImage.image = UIImage(contentsOfFile: "StartButton")
        
    }
    func looping(){
    loopTimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "jiffing", userInfo: nil, repeats: true)
    }
    func jiffing() {
        startImage.image = UIImage(named: "StartButton")
        
        
        
    }
    

}
