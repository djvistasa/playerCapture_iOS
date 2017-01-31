//
//  preProjectAPI.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/01/24.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON

//let PetApi = _PetApi()
let petAPI = _PetApi()

class _PetApi : Service {

     init() {
        super.init(baseURL: "http://localhost:3000")
        
        //Configuration
        self.configure {
            let SwiftyJSONTransformer = ResponseContentTransformer { JSON($0.content as AnyObject) }
            $0.pipeline[.parsing].add(SwiftyJSONTransformer, contentTypes: ["*/json"])
        }
        
        //self.configureTransformer("/login/*") {
        //    ($0.content as JSON)["results"].arrayValue
        //}
    }
    
}

private let SwiftyJSONTransformer =
    ResponseContentTransformer
        { JSON($0.content as AnyObject) }
