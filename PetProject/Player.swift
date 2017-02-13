//
//  Player.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/02/13.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Player {
 
    let name: String
    let surname: String
    let age: String
    //let nationality: String
    let sport: String
    let position: String
    let avatar: String?
    let weight: String
    let height: String
    
    init(json: JSON) {
        
        NSLog("\(json)")
        name = json["name"].string!
        surname = json["surname"].string!
        age = json["age"].string!
        //nationality = json["nationality"].string!
        sport = json["sport"].string!
        position = json["position"].string!
        avatar = json["avatar_file_name"].string
        weight = json["weight"].string!
        height = json["height"].string!
    }

}
