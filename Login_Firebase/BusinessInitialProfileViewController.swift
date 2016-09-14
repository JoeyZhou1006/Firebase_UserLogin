//
//  BusinessInitialProfileViewController.swift
//  Login_Firebase
//
//  Created by Zhou Yu on 8/09/2016.
//  Copyright © 2016 Joey Zhou. All rights reserved.
//

import UIKit
import Firebase

class BusinessInitialProfileViewController: UIViewController {
    
    //create firebase storage reference
    var StorageRef = FIRDatabase.database().reference()
    
    
    
    //here should have a reference uid of the user
    var Uid = ""
    
    override func viewWillAppear(animated: Bool) {
        print("signed up users uid is "+self.Uid)
    }
    
    
    @IBOutlet weak var inputName: UITextField!
    
    
    

  
    @IBAction func submitBusinessName(sender: AnyObject) {
        
        //check whether someone already registered with this names
       // checkWhetherNameExists()
        //sent the current users name associated with the uid to the firebase storage
        
        //1. create a reference to the storage of the firebase

        //workng code
        StorageRef.child("businessUsers").child(Uid).child("Business_Names").setValue(inputName.text)

        
    }
    
    
    //this function should search through all the business users, and check the child attribute "name" whether exsits or not

    
    @IBAction func dismissCurrentView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    

}
