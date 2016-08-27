//
//  ViewController.swift
//  Experiment
//
//  Created by Mariam Sulakian on 12/31/15.
//  Copyright © 2015 Mariam Sulakian. All rights reserved.
//

import UIKit
import GameplayKit

class TapsViewController: UIViewController
{

    @IBOutlet weak var mainCircleImage: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet var earnings: UILabel!
    @IBOutlet var tapsLeft: UILabel!
    @IBOutlet weak var circleButton: UIButton!
    
    
    var taps: Int = 5
    var earn: Double = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // set taps left
        tapsLeft.text = "\(taps)"
        // set earnings
        earnings.text = "\(earn)0"
    }

    
    @IBAction func circle(sender: AnyObject)
    {
        let random = arc4random_uniform(3)
        
        // change image of button
        circleButton.imageView?.image = UIImage(named: "\(rand)Circle.png")
        self.view.sizeToFit()
        
        // change taps
        // update taps label
        taps -= 1
        tapsLeft.text = "\(taps)"
        
        if taps == 0{
            performSegueWithIdentifier("toTapResults", sender: self)
        }
        
        // change earnings
        switch random
        {
        case 1:
            // red: lose 50 cents
            mainCircleImage.image = UIImage(named: "redCircle")
            earn -= 0.5
            
        case 2:
            // green: gain $1
            mainCircleImage.image = UIImage(named: "greenCircle")
            earn += 1
            
        default:
            mainCircleImage.image = UIImage(named: "blueCircle")
            return
        }
        
        // update earnings label
        earnings.text = "\(earn)0"
        
    }
    
    //pass data to next VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toTapResults") {
            let vc = segue.destinationViewController as! TapsResultsVCViewController
            
            vc.tapsUsed = taps
            vc.earnings = earn 
        }
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

