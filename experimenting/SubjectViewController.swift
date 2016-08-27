//
//  SubjectViewController.swift
//  experimenting
//
//  Created by Mariam on 8/17/16.
//  Copyright © 2016 Mariam Sulakian. All rights reserved.
//

import UIKit
import JLToast

class SubjectViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var subjectNumber: UITextField!
    //save subject number
    let textFieldContentsKey = "textFieldContents"
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectNumber.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Saving When Done Editing
    func textFieldDidEndEditing(textField: UITextField) {
        saveText()
        print(subjectNumber.text!)
        DataController.sharedInstance.subjectNumber = subjectNumber.text!
        print(DataController.sharedInstance.subjectNumber)
    }
    func saveText() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(subjectNumber.text, forKey: textFieldContentsKey)
    }

    //Stop Editing on Return Key Tap
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "toMenu"{
            //if text field is empty show error
            if (subjectNumber.text == ""){
                JLToast.makeText("Enter subject number", delay: 0.25, duration: JLToastDelay.ShortDelay).show()
                return false
            }
            //else proceed with segue
            return true
        }
        //if wrong identifier
        return false
    }
    //dismiss keyboard on tap
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
}
}