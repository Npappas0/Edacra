//
//  ViewController.swift
//  Edacra
//
//  Created by NPappas on 4/5/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    @IBOutlet weak var pointCounter: UILabel!
    //I WANT TO COMMIT MYSELF TO NICK IN ALL HIS GLORY;
    //UI Objects
    var timer = NSTimer()
    var stickTimer = NSTimer()
    var innerView = UIView()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var joystickImage: UIImageView!
    
    // Naming Variables
    var xMove = CGFloat(0)
    var yMove = CGFloat(12)
    var xPos = CGFloat(0)
    var yPos = CGFloat(0)
    var joystickCounter = 1
    var currentDirection = "Down"
    var joystickDirection = ""
    let directions = [UISwipeGestureRecognizerDirection.Right, UISwipeGestureRecognizerDirection.Left, UISwipeGestureRecognizerDirection.Up, UISwipeGestureRecognizerDirection.Down]
    
    
    ///Randomizer Variables
    var spawnedBlocks : [UIView] = []
    var creationArray : [Int] = []
    var snake : [UIView] = []
    ////
    // Musac
    //let soundFilePath = NSBundle.mainBundle().pathForResource("mySound", ofType: "mySound")
    //let soundFileURL = NSURL(fileURLWithPath: soundFilePath!)
    //let player = AVAudioPlayer(contentsOfURL: soundFileURL, error: nil)
    //player.numberOfLoops = -1 //infinite
    //player.play()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pointCounter.text = "0"
        timerFunction()
        
        innerView = UIView(frame: CGRectMake((view.frame.width - 257)/2, 65, 252, 252))
        //innerView.backgroundColor = UIColor.blackColor()
        view.addSubview(innerView)
        
        
        xPos = 144
        yPos = 144
        
        snake.append(createBlock(Int(xPos), y: Int(yPos), round: false))
        
        
        self.view.backgroundColor = UIColor.redColor()
        
        
        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        //backgroundImage.frame = CGRectMake(0,0, screenSize.height * 0.2, 50)
        

        

        
        
        for var y = 0; y < 2; y++
        {
            for var x = 12; x < 252; x += 12
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
    
    func stickingTimer(){
        stickTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveJoystick", userInfo: nil, repeats: true)
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
                if currentDirection != "Left"
                {
                    xMove = 12
                    yMove = 0
                    currentDirection = "Right"
                    joystickDirection = "R"
                }
            case UISwipeGestureRecognizerDirection.Down:
                if currentDirection != "Up"
                {
                    xMove = 0
                    yMove = 12
                    currentDirection = "Down"
                    joystickDirection = "D"
                }
            case UISwipeGestureRecognizerDirection.Left:
                if currentDirection != "Right"
                {
                    xMove = -12
                    yMove = 0
                    currentDirection = "Left"
                    joystickDirection = "L"
                }
            case UISwipeGestureRecognizerDirection.Up:
                if currentDirection != "Down"
                {
                    xMove = 0
                    yMove = -12
                    currentDirection = "Up"
                    joystickDirection = "U"
                }
            default:
                break
            }
            stickingTimer()
        }
    }
    
    @IBAction func tapStop(sender: UITapGestureRecognizer)
    {
        xMove = 0
        yMove = 0
    }
    
    func updatePosition()
    {
        for var x = 0; x < snake.count - 1; x++
        {
            if (CGRectIntersectsRect(snake.last!.frame, snake[x].frame))
            {
                gameOver()
            }
        }
        if (CGRectIntersectsRect(snake.last!.frame, spawnedBlocks.last!.frame))
        {
            spawnedBlocks.last!.removeFromSuperview()
            snake.append(createBlock(Int(xPos), y: Int(yPos), round: false))
            snake.append(createBlock(Int(xPos), y: Int(yPos), round: false))
            snake.append(createBlock(Int(xPos), y: Int(yPos), round: false))
            blockRandom()
            pointCounter.text = (Int(pointCounter.text!)! + 10).description
        }
            xPos += xMove
            yPos += yMove
        snake.append(createBlock(Int(xPos), y: Int(yPos), round: false))
        
        if snake.count == 2
        {
            currentDirection = ""
        }
        if snake.count != 1
        {
            snake.removeFirst().removeFromSuperview()
        }
        
        if (xPos < 0||(xPos > innerView.frame.width - 12)||(yPos > innerView.frame.height - 12)||(yPos < 12))
        {
            gameOver()
        }
    }
    
    func moveJoystick()
    {
        if joystickCounter == 1 || joystickCounter == 2
        {
            joystickImage.image = UIImage(named: "stick\(joystickDirection)\(joystickCounter)")
            joystickCounter = joystickCounter + 1
        }
        else if joystickCounter == 3
        {
            joystickImage.image = UIImage(named: "stick\(joystickDirection)\(1)")
            joystickCounter = joystickCounter + 1
        }
        else if joystickCounter == 4
        {
            joystickCounter = 1
            joystickImage.image = UIImage(named: "stickN")
            joystickDirection = ""
            stickTimer.invalidate()
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
            spawnedBlocks.append(createBlock(creationArray.removeAtIndex(Int(arc4random_uniform(12)) % (creationArray.count)),y: creationArray.removeAtIndex(Int(arc4random_uniform(12)) % (creationArray.count)), round: true))
        }
    }
    
    
    func createBlock(x: Int, y: Int, round: DarwinBoolean) -> UIView
    {
        let rBlock = UIView(frame: CGRectMake((CGFloat)(x), (CGFloat)(y), 12, 12))
        if round
        {
            rBlock.layer.cornerRadius = 6
        }
        rBlock.backgroundColor = UIColor.whiteColor()
        innerView.addSubview(rBlock)
        return rBlock
    }

    func resetGame()
    {
        xMove = 0
        yMove = 0
        xPos = 124
        yPos = 124
        timer.invalidate()
        innerView.removeFromSuperview()
        
        for snakeBlock in snake
        {
            snakeBlock.removeFromSuperview()
        }
        snake.removeAll()
        
        pointCounter.text = "0"
        timerFunction()
        
        innerView = UIView(frame: CGRectMake((view.frame.width - 258)/2, 65, 252, 252))
        //innerView.backgroundColor = UIColor.blackColor()
        view.addSubview(innerView)
        
        xPos = 144
        yPos = 144
        
        snake.append(createBlock(Int(xPos), y: Int(yPos), round: false))
        
        for var y = 0; y < 4; y++
        {
            for var x = 12; x < 252; x += 12
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
    
    func gameOver()
    {
        let alert = UIAlertController(title: "GameOver", message: "gg", preferredStyle: .Alert)
        
        resetGame()
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
        }
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
    }
}