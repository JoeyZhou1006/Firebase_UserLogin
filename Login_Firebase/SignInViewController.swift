//
//  SignInViewController.swift
//  Login_Firebase
//
//  Created by Zhou Yu on 6/09/2016.
//  Copyright © 2016 Joey Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInEmail: UITextField!

    @IBOutlet weak var signInPassword: UITextField!
    
    
    @IBAction func loginAction(sender: AnyObject) {
        //when the user input both email address field and password field
        if (signInEmail.text != nil && signInPassword.text != nil) {
            //connect to the firebase and check the existence of this account
            FIRAuth.auth()?.signInWithEmail(signInEmail.text!, password: signInPassword.text!) {(user, error) in
                //when the user input the wrong email address or password, ask user to input again
                if(error != nil){
                    print("Either the input email address or password is incorrect, place try it again")
                }
                else{
                    print("user with email address "+user!.email!+"is successfully logged in")
                
                }
            }
        }
    }
    
    
    @IBAction func backToPreviousMenu(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
    
    
    
    
}
