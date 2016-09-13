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
    let storage = FIRStorage.storage()
    
    
    
    //here should have a reference uid of the user
    var Uid = ""
    
    override func viewWillAppear(animated: Bool) {
        print("signed up users uid is "+self.Uid)
    }
    
    
    @IBOutlet weak var inputName: UITextField!
  
    @IBAction func submitBusinessName(sender: AnyObject) {
        //sent the current users name associated with the uid to the firebase storage
        
        
        storage
        
        
    }
    
    
    //this function should search through all the business users, and check the child attribute "name" whether exsits or not
    func checkWhetherNameExists(){
        
        
    
    
    }
    
    @IBAction func dismissCurrentView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    

}
