//
//  SignUpNewUserViewController.swift
//  Login_Firebase
//
//  Created by Zhou Yu on 6/09/2016.
//  Copyright © 2016 Joey Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpNewUserViewController: UIViewController
{
    
    @IBOutlet weak var newUserEmail: UITextField!
    
    @IBOutlet weak var newUserPassword: UITextField!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var userID=""
    
    override func viewWillAppear(animated: Bool) {
        self.activityIndicator.hidden = true
    }
    
    
    @IBAction func createNewAccount(sender: UIButton) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        FIRAuth.auth()?.createUserWithEmail(newUserEmail.text!, password: newUserPassword.text!, completion: { (user: FIRUser?, error) in
            if error != nil {
                print(error)
                
                let alert = UIAlertController(title: "Opposs", message: "Seems like some one already registered with this account", preferredStyle: UIAlertControllerStyle.Alert)
                
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
            else{
            
                //Create the alert
                let alert = UIAlertController(title: "Congratulations!!!", message: "You are successfully registered with us :D ", preferredStyle: UIAlertControllerStyle.Alert)
                
                //create an action (button)
                let okAction = UIAlertAction(title:"OK", style: .Default, handler:  { action in
                    
                    
                    //when the user tapped the ok button, navigate the user to the business profile page to set up their account
                    print("ok is tapped")
                    self.navigateToBusinessProfile()
                    
                    
                    }
                )
                
  
                    
                //add the action to the alert controller
                alert.addAction(okAction)
                //show the alert
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.presentViewController(alert, animated: true, completion: nil)
                
                //should pass users UID to the next view
                print(user!.uid)
                //assign the unique user identifaction id to a variable
                self.userID = user!.uid
                
                
            }
        })
    }
    
    @IBAction func dismissSignUp(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
    //prepare the user's uid to be sent to the next view which is the business initial profile view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let businessViewController = segue.destinationViewController as! BusinessInitialProfileViewController
        
        //debug code to check whether the users uid is generated properly
        if(userID == ""){
            print("the user id is nil")
        
        }
        
        businessViewController.Uid = userID

    
        
    }
    
    
    //the function that does the action that navigate to the yours profile page
    func navigateToBusinessProfile(){
        self.performSegueWithIdentifier("businessInitialProfileSegue", sender: self)
    
    }
    
    
    
    

    

}
