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
    var creationArray : [Int] = []
    var snake : [UIView] = []
    ////
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pointCounter.text = "0"
        timerFunction()
        
        innerView = UIView(frame: CGRectMake((view.frame.width - 300)/2, 50, 300, 300))
        innerView.backgroundColor = UIColor.blackColor()
        view.addSubview(innerView)
        
        xPos = 144
        yPos = 144
        
        snake.append(createBlock(Int(xPos), y: Int(yPos)))
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "StartButton")!)
        
        
        for var y = 0; y < 2; y++
        {
            for var x = 12; x < 300; x += 12
            {
                creationArray.append(x)
            }
        }
        blockRandom()
        
        for direction in directions
        {
            let swipe = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipe.direction = direction
            self.view.addGestureRecognizer(swipe)
        }
    }
    
    func timerFunction()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "updatePosition", userInfo: nil, repeats: true)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.Right:
                xMove = 12
                yMove = 0
            case UISwipeGestureRecognizerDirection.Down:
                xMove = 0
                yMove = 12
            case UISwipeGestureRecognizerDirection.Left:
                xMove = -12
                yMove = 0
            case UISwipeGestureRecognizerDirection.Up:
                xMove = 0
                yMove = -12
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
        if (CGRectIntersectsRect(snake.last!.frame, spawnedBlocks.last!.frame))
        {
            spawnedBlocks.last!.removeFromSuperview()
            snake.append(createBlock(Int(xPos), y: Int(yPos)))
            blockRandom()
            pointCounter.text = (Int(pointCounter.text!)! + 10).description
        }
            xPos += xMove
            yPos += yMove
            snake.append(createBlock(Int(xPos), y: Int(yPos)))
        
        if snake.count != 1
        {
            snake.removeFirst().removeFromSuperview()
        }
        
        if (xPos < 12)||(xPos > innerView.frame.width - 24)||(yPos > innerView.frame.height - 24)||(yPos < 24)
        {
           
            //Probably change to
               //write code here for what happens then aleart happens
            xMove = 0
            yMove = 0
            xPos = 144
            yPos = 144
            
            for snakeBlock in snake
            {
                snakeBlock.removeFromSuperview()
            }
            snake.removeAll()
            snake.append(createBlock(Int(xPos), y: Int(yPos)))
            
            let alert = UIAlertController(title: "GameOver", message: "gg", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                
            
                
                
            }
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
    }
}
    func blockRandom()
    {
        if creationArray.count == 0
        {
            print("Game Over")
        }
        else
        {
            spawnedBlocks.append(createBlock(creationArray.removeAtIndex(Int(arc4random()) % (creationArray.count)),y: creationArray.removeAtIndex(Int(arc4random()) % (creationArray.count))))
        }
    }
    
    func createBlock(x: Int, y: Int) -> UIView
    {
        let rBlock = UIView(frame: CGRectMake((CGFloat)(x), (CGFloat)(y), 12, 12))
        rBlock.backgroundColor = UIColor.whiteColor()
        innerView.addSubview(rBlock)
        return rBlock
    }


}