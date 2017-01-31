//
//  validateTextField.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/01/31.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import Foundation
import UIKit

class validateTextfield {

    class func validateField(_ textField: UITextField) -> Bool {
        if let _: String = textField.text, !(textField.text?.isEmpty)! {
            textField.layer.borderWidth = 0.0
            return true
        } else { // This text field is empty, style it
            textField.layer.borderWidth = 0.5
            textField.layer.cornerRadius = 4.2
            textField.layer.borderColor =  UIColor.red.cgColor
            return false
        }

    
    }

}
