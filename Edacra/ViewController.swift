//
//  ViewController.swift
//  Edacra
//
//  Created by NPappas on 4/5/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var pointCounter: UILabel!
    
    //UI Objects
    var block = UIView()
    var timer = NSTimer()
    var timer2 = NSTimer()
    var innerView = UIView()
    
    // Naming Variables
    var xMove = CGFloat(0)
    var yMove = CGFloat(0)
    var xPos = CGFloat(0)
    var yPos = CGFloat(0)
    let directions = [UISwipeGestureRecognizerDirection.Right, UISwipeGestureRecognizerDirection.Left, UISwipeGestureRecognizerDirection.Up, UISwipeGestureRecognizerDirection.Down]
    
    ///Randomizer Variables
    var spawnedBlocks : [UIView] = []
    var rBlock = UIView()
    var creationArrayX = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290]
    var creationArrayY = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290]
    var personalNumber = UInt32(29)
    var number1 = Int()
    var number2 = Int()
    var xCreation = Int()
    var yCreation = Int()
    ////
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        timerFunction()
        
        innerView = UIView(frame: CGRectMake(20
            , 50
            , 300, 300))
        innerView.backgroundColor = UIColor.blackColor()
        view.addSubview(innerView)
        
        block = UIView(frame: CGRectMake(150, 150
            , 10, 10))
        block.backgroundColor = UIColor.whiteColor()
        self.innerView.addSubview(block)
        
        view.backgroundColor = UIColor.magentaColor()
        
        for direction in directions
        {
            let swipe = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipe.direction = direction
            self.view.addGestureRecognizer(swipe)
        }
        
       
        
    }
    
    func timerFunction()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updatePosition", userInfo: nil, repeats: true)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: "blockRandom", userInfo: nil, repeats: true)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.Right:
                xMove = 10
                yMove = 0
            case UISwipeGestureRecognizerDirection.Down:
                xMove = 0
                yMove = 10
            case UISwipeGestureRecognizerDirection.Left:
                xMove = -10
                yMove = 0
            case UISwipeGestureRecognizerDirection.Up:
                xMove = 0
                yMove = -10
            default:
                break
            }
        }
    }
    
    @IBAction func tapStop(sender: UITapGestureRecognizer)
    {
        xMove = 0
        yMove = 0
    }
    
    func updatePosition()
    {
        xPos += xMove
        yPos += yMove
        pointCounter.text = "\(xPos)"
        self.block.transform = CGAffineTransformMakeTranslation(xPos, yPos)
        if xPos == 150||(xPos == -150)||(yPos == 150)||(yPos == -150)
        {
            //Probably change to
               //write code here for what happens then aleart happens
            xPos = CGFloat(0)
            yPos = CGFloat(0)
            let alert = UIAlertController(title: "GameOver", message: "gg", preferredStyle: .Alert)
            
            var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
            
                
                
            }
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
    }
}
    func blockRandom() {
        if personalNumber == 1{
            print("Gayme Ogre")
        }
        else{
        number1 = Int(arc4random() % personalNumber)
        xCreation = creationArrayX[number1]
        creationArrayX.removeAtIndex(number1)
        
        number2 = Int(arc4random() % personalNumber)
        yCreation = creationArrayY[number2]
        creationArrayY.removeAtIndex(number2)
        
        randomatior(xCreation, y: yCreation)
        personalNumber = personalNumber - UInt32(1)
        }
    }
    func randomatior(x: Int, y: Int){
        rBlock = UIView(frame: CGRectMake((CGFloat)(x), (CGFloat)(y), 10, 10))
        rBlock.backgroundColor = UIColor.whiteColor()
        innerView.addSubview(rBlock)
        spawnedBlocks.append(rBlock)
        
    }


}