//
//  InvitationViewController.swift
//  Login_Firebase
//
//  Created by Zhou Yu on 12/09/2016.
//  Copyright © 2016 Joey Zhou. All rights reserved.
//

import UIKit
import FirebaseDatabase

class InvitationViewController: UIViewController {
    
    
    
    //this function here will validate the invitation code that is being input, if succeed, then use segue to go to the sign in page
    var ref: FIRDatabaseReference!
    
    var refHandle: UInt!
    
    var codeRetrived = ""
    
    @IBOutlet weak var inputCode: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //create a reference to the firebase datbase, retrieve the key value set,
        ref = FIRDatabase.database().reference()
        refHandle = ref.observeEventType(FIRDataEventType.Value, withBlock: {
            (snaptshot) in
            
            //retrieve all the data sets in the database
            let dataDict = snaptshot.value as! [String: AnyObject]
            print(dataDict)
            self.codeRetrived = dataDict["InvitationCode"] as! String
            
            print(self.codeRetrived)
            
        })
        
    }
    
    
    //the method that connect to the firebase database to check whether the code entered is validated or not
    @IBAction func ValidateCode(sender: AnyObject) {
        if (inputCode.text != codeRetrived) {
            print("validataion failed, please contact joeyzhouaus@gmail.com for enquiries")
            
        }else{
            print("congratulations, you can start to create your own business page")
            
            //create the alert
            let alert = UIAlertController(title: "Congratulations!!!", message: "Hey, the future Master cheif, You are the Chosen one, hope the force be with you", preferredStyle: UIAlertControllerStyle.Alert)
            
            //create an action
            let okAction = UIAlertAction(title:"ok", style: .Default, handler: { action in
                
                //when the user tapped the ok button, navigate the user to the page sign in or sign up
                self.navigateToSignInPage()
                
            
            })
            
            //register the ok action to the alert view
            alert.addAction(okAction)
            
            //show the alert view window
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func backToMenu(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        
        
    }
    
    
    func navigateToSignInPage(){
        self.performSegueWithIdentifier("codeValidated", sender: self)
    
    
    }

}