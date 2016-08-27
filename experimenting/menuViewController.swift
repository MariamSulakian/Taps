//
//  menuViewController.swift
//  experimenting
//
//  Created by Mariam on 8/17/16.
//  Copyright © 2016 Mariam Sulakian. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }
    @IBAction func onTapButton(sender: AnyObject) {
        let TapsVC = self.storyboard?.instantiateViewControllerWithIdentifier("TapsVC") as? TapsViewController
        self.navigationController?.pushViewController(TapsVC!, animated: true)
    }
    
    @IBAction func onBalloonButton(sender: AnyObject) {
    
        let balloonPop = self.storyboard?.instantiateViewControllerWithIdentifier("balloonPop") as? balloonViewController
        self.navigationController?.pushViewController(balloonPop!, animated: true)

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
