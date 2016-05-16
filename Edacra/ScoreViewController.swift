//
//  ScoreViewController.swift
//  Edacra
//
//  Created by NPappas on 5/12/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController
{

    @IBOutlet weak var scoreList: UILabel!
    
    var scoreArray : [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().stringArrayForKey("finalScores") == nil
        {
        for var x = 0; x < 12; x = x + 1
        {
            scoreArray.append("0")
        }
        NSUserDefaults.standardUserDefaults().setObject(scoreArray, forKey: "finalScores")
        }
        
        if NSUserDefaults.standardUserDefaults().stringArrayForKey("finalScores") != nil && NSUserDefaults.standardUserDefaults().stringArrayForKey("savedScores") != nil
        {
            scoreArray = NSUserDefaults.standardUserDefaults().stringArrayForKey("finalScores")! + NSUserDefaults.standardUserDefaults().stringArrayForKey("savedScores")!
            NSUserDefaults.standardUserDefaults().removeObjectForKey("savedScores")
        }
        else
        {
            scoreArray = scoreArray + NSUserDefaults.standardUserDefaults().stringArrayForKey("finalScores")!
            NSUserDefaults.standardUserDefaults().removeObjectForKey("savedScores")
        }
        
        NSUserDefaults.standardUserDefaults().setObject(scoreArray, forKey: "finalScores")
        
        scoreArray = scoreArray.sort(>)
        
        var tempArray : [String] = []
        if scoreArray.count > 10
        {
            for var x = 0; x < 10; x += 1
            {
                tempArray.append(scoreArray[x])
            }
        }
        else
        {
            tempArray = scoreArray
        }
        
        for score in tempArray
        {
            scoreList.text = scoreList.text! + score + "\n"
        }
    }

    @IBAction func onButtonTap(sender: AnyObject)
    {
        performSegueWithIdentifier("scoreToMenu", sender: self)
    }
}
