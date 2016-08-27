//
//  balloonViewController.swift
//  experimenting
//
//  Created by Mariam on 8/19/16.
//  Copyright © 2016 Mariam Sulakian. All rights reserved.
//

import UIKit

class balloonViewController: UIViewController {

    @IBOutlet weak var balloonImage: UIImageView!
    
    @IBAction func onBalloonTap(sender: UITapGestureRecognizer) {
        animate()
    }
    var taps: Int = 5

    func animate(){
        //make random function so either balloon expands or pops
        
        //returns 0,1 but not 2
        let random = arc4random_uniform(2)
        
        //NOTES
        //make balloon grow by 0.25 each time, pop randomly
        
        
        
        switch random{
        case 1:
            //balloon pops on tap
            balloonImage.hidden = true
            print("popped")
        
        default:
            //balloon expands
        if taps == 5{
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.balloonImage.transform = CGAffineTransformMakeScale(1.25, 1.25)
            self.taps -= 1
        })} else if taps == 4{
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.balloonImage.transform = CGAffineTransformMakeScale(1.50, 1.50)
                self.taps -= 1
                
            })}else if taps == 3{
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.balloonImage.transform = CGAffineTransformMakeScale(1.75, 1.75)
                self.taps -= 1
                
            })}else if taps == 2{
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.balloonImage.transform = CGAffineTransformMakeScale(2.00, 2.00)
                self.taps -= 1
                
            })}else if taps == 1{
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.balloonImage.transform = CGAffineTransformMakeScale(2.25, 2.25)
                self.taps -= 1
                
            })}else{
            //you win image
            //performSegueWithIdentifier("toBalloonResults", sender: self)
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Balloon Pop"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}