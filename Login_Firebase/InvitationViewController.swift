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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var codeRetrived = ""
    
    @IBOutlet weak var inputCode: UITextField!
    
    
    //before the view is being displayed, make the activity indicator hidden
    override func viewWillAppear(animated: Bool) {
        self.activityIndicator.hidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //the method that connect to the firebase database to check whether the code entered is validated or not
    @IBAction func ValidateCode(sender: AnyObject) {
        
       // self.RetriveInvitationCode()
        
        self.activityIndicator.hidden = false
        self.activityIndicator.startAnimating()
        
       // self.compareRetrivedinvitationAndUserinput()
        
        
        //make sure we retrieve code first then compare
        let queue = NSOperationQueue()
        
        let retrieve = self.RetriveInvitationCode()
        let compare = self.compareRetrivedinvitationAndUserinput()
        
        compare.addDependency(retrieve)
        
        
       

    }
    
    
    
    //compare the user input invitation code and the code retrived from the firebase
    func compareRetrivedinvitationAndUserinput(){
        
        if (inputCode.text != codeRetrived) {
            
            print("validataion failed, please contact joeyzhouaus@gmail.com for enquiries")
            //create the alert
            let alert = UIAlertController(title: "Ooppos", message: "Seems like you are not invited, but don't worry, call joey at 0449978657 or sent him an email at joeyzhouaus@gmail.com for further enquiry", preferredStyle: UIAlertControllerStyle.Alert)
            
            //Creat an ok action
            let okAction = UIAlertAction(title:"ok", style: .Default, handler: {
                action in
                
                alert.dismissViewControllerAnimated(true, completion: {})
            })
            alert.addAction(okAction)
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
            
            //present the alert view that tells the user that they are not invited by the given input code
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            self.inputCode.text = ""
            
            
            
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
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
            //show the alert view window
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    
    
    }
    
    
    func RetriveInvitationCode(){
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
    
    
    @IBAction func backToMenu(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        
        
    }
    
    
    func navigateToSignInPage(){
        self.performSegueWithIdentifier("codeValidated", sender: self)
    
    
    }

}