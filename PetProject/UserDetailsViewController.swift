//
//  UserDetailsViewController.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/01/25.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import Foundation
import UIKit
import Siesta
import SwiftyJSON

class UserDetailsViewController: UIViewController {

    var userIndex:Int!
    var userArray: JSON = []
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userSurname: UILabel!
    @IBOutlet weak var userAge: UILabel!
    override func viewDidLoad() {
       super.viewDidLoad()
        
        //print(userArray[userIndex])
        //print(userIndex)
        
        for user in userArray["users"] {
            if Int(user.0) == userIndex {
                print(user.1)
                
                if let checkedUrl = URL(string: String(describing: user.1["avatar"])) {
                    userImage.contentMode = .scaleAspectFit
                    downloadImage(url: checkedUrl)
                }
                
                userName.text = "Name: \(String(describing: user.1["name"]))"
                userSurname.text = "Surname: \(String(describing: user.1["surname"]))"
                userAge.text = "Age: \(String(describing: user.1["age"]))"
                
            }
            
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.userImage.image = UIImage(data: data)
            }
        }
    }
}
