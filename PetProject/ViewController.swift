//
//  ViewController.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/01/11.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Siesta
import SwiftyJSON


class ViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    let loginResource = petAPI.resource("/sign_in")

    @IBAction func handleLoginClick(_ sender: Any) {
        // validate these fileds
        let usernameValidated =  validateTextfield.validateField(username)
        let passwordValidated = validateTextfield.validateField(password)
        if usernameValidated && passwordValidated {
            // fire off login call and navigate to home 
            self.errorLabel.alpha = 0.0
            loginResource.request(.post, json: [
                "username": username.text,
                "password": password.text
                ]).onSuccess({ data in
                var responseContent = data.content as! JSON
                
                if responseContent["success"] == 1 {
                    self.performSegue(withIdentifier: "HomePage", sender: self)
                } else {
                    self.errorLabel.alpha = 1.0
                }
                
                print(responseContent["success"])
            }).onFailure({data in
                self.errorLabel.alpha = 1.0
            
            })
            //self.performSegue(withIdentifier: "HomePage", sender: self)
        }
    }

    @IBAction func usernameValueChanged(_ sender: Any) {
        _ = validateTextfield.validateField(username)
    }
    @IBAction func passwordValueChanged(_ sender: Any) {
        _ = validateTextfield.validateField(password)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0.0
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTextField(_ textField: UITextField) -> Bool{
    
        if let _: String = textField.text, !(textField.text?.isEmpty)! {
            textField.layer.borderWidth = 0.0
            return true
        } else { // This text field is empty, style it
            textField.layer.borderWidth = 0.5
            textField.layer.cornerRadius = 4.2
            textField.layer.borderColor =  UIColor.red.cgColor
            return false
        }
        
       // return true
    }


}

