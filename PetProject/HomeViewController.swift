//
//  HomeViewController.swift
//  PetProject
//
//  Created by Sive Mwanda on 2017/01/12.
//  Copyright © 2017 Sive Mwanda. All rights reserved.
//

import Foundation
import UIKit
import Siesta
import SwiftyJSON

class HomeViewController: UITableViewController {
    
    var playerArray = [Player]()
    var fullPlayerArray:JSON = []
    var rowInt:Int = 0
    let getPlayers = petAPI.resource("/get_players")
    var clearTable:Bool = false
    
    
    @IBAction func createPlayer(_ sender: Any) {
           performSegue(withIdentifier: "createPlayer", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        // hide back button as this is laning page
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clearTable = true
        getPlayers.request(.get).onSuccess({ data in
            let responseContent = data.content as! [Player]
            
            self.playerArray.removeAll()

            self.playerArray = responseContent
            self.tableView.reloadData()
            
        }).onFailure({data in
            
            
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return playerArray.count


    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        //cell.textLabel?.text = playerArray[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        rowInt = indexPath.row
        
        performSegue(withIdentifier: "userDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "userDetails") {
            let destinationController = segue.destination as! UserDetailsViewController;
            
            destinationController.playerIndex = rowInt
            destinationController.playerArray = fullPlayerArray
            
        }
    }

    
    
    
}

