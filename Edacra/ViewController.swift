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
    //UI Objects
    var block = UIView()
    var timer = NSTimer()
    
    // Naming Variables
    var xMove = CGFloat(0)
    var yMove = CGFloat(0)
    var xPos = CGFloat(0)
    var yPos = CGFloat(0)
    let directions = [UISwipeGestureRecognizerDirection.Right, UISwipeGestureRecognizerDirection.Left, UISwipeGestureRecognizerDirection.Up, UISwipeGestureRecognizerDirection.Down]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        timerFunction()
        block = UIView(frame: CGRectMake(150, 150
            , 10, 10))
        block.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(block)
        view.backgroundColor = UIColor.blackColor()
        
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
        self.block.transform = CGAffineTransformMakeTranslation(xPos, yPos)
    }
}



