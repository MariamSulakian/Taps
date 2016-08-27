//
//  TapsResultsVCViewController.swift
//  experimenting
//
//  Created by Mariam on 8/17/16.
//  Copyright © 2016 Mariam Sulakian. All rights reserved.
//

import UIKit

class TapsResultsVCViewController: UIViewController {
        
    @IBOutlet weak var subjectNumber: UILabel!
    @IBOutlet weak var tapsUsedLabel: UILabel!
    @IBOutlet weak var earningsLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    var tapsUsed = 0
    var earnings = 0.00

    var skyBlueColor = UIColor(hue: 0.5639, saturation: 0.51, brightness: 1, alpha: 1.0) /* #7bccff */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar custom
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.title = "Results"
        
        //set passed data to variables
        tapsUsedLabel.text = String(tapsUsed)
        earningsLabel.text = "$\(earnings)0"
        
        subjectNumber.text = DataController.sharedInstance.subjectNumber
        
        //UI of labels
        resultsLabel.layer.cornerRadius = 2
        resultsLabel.layer.borderWidth = 2.0
        resultsLabel.layer.borderColor = skyBlueColor.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //return to menu
    @IBAction func onNewButton(sender: AnyObject) {
        let menu = self.storyboard?.instantiateViewControllerWithIdentifier("menuVC") as? menuViewController
        self.navigationController?.pushViewController(menu!, animated: true)
    }
    
    //return to welcome screen
    @IBAction func onDoneButton(sender: AnyObject) {
        let first = self.storyboard?.instantiateViewControllerWithIdentifier("SubjectVC") as? SubjectViewController
        self.navigationController?.pushViewController(first!, animated: true)
    }
}