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
    
    
    @IBOutlet weak var inputName: UITextField!
  
    @IBAction func submitBusinessName(sender: AnyObject) {
        
        
    }
    
    
    //this function should search through all the business users, and check the child attribute "name" whether exsits or not
    func checkWhetherNameExists(){
        
        
        
        
    
    }

}