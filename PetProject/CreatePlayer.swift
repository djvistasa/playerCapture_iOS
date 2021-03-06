//
//  CreatePlayer.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/01/31.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import Foundation
import UIKit
import Siesta
import SwiftyJSON

class CreatePalyer : UIViewController {
    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var playerSurname: UITextField!
    @IBOutlet weak var playerAge: UITextField!
    @IBOutlet weak var playerSport: UITextField!
    @IBOutlet weak var playerTeam: UITextField!
    @IBOutlet weak var playerPosition: UITextField!
    @IBOutlet weak var playerWeight: UITextField!
    @IBOutlet weak var playerHeight: UITextField!
    
    let createPlayerResource = petAPI.resource("/create_player")
    
    
    @IBAction func createPlayer(_ sender: Any) {
        let nameValidated = validateTextfield.validateField(playerName)
        let surnameValidated = validateTextfield.validateField(playerSurname)
        let ageValidated = validateTextfield.validateField(playerAge)
        let sportValidated = validateTextfield.validateField(playerSport)
        let teamValidated = validateTextfield.validateField(playerTeam)
        let positionValidated = validateTextfield.validateField(playerPosition)
        let weightValidated = validateTextfield.validateField(playerWeight)
        let heightValidated = validateTextfield.validateField(playerHeight)
        
        if nameValidated &&
            surnameValidated &&
            ageValidated &&
            sportValidated &&
            teamValidated &&
            positionValidated &&
            weightValidated &&
            heightValidated
        {
         // name valid
            
            createPlayerResource.request(.post, json: [
                "name": playerName.text,
                "surname": playerSurname.text,
                "age": playerAge.text,
                "sport": playerSport.text,
                "team": playerTeam.text,
                "position": playerPosition.text,
                "weight": playerWeight.text,
                "height": playerHeight.text
                ]).onSuccess({ data in
                    var responseContent = data.content as! JSON
                    
                    if responseContent["success"] == 1 {
                        self.performSegue(withIdentifier: "HomePage", sender: self)
                    } else {
                        // self.errorLabel.alpha = 1.0
                    }
                    
                    print(responseContent["success"])
                }).onFailure({data in
                    //self.errorLabel.alpha = 1.0
                    
                })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    

}
