//
//  HomeViewController.swift
//  Basketball Sim
//
//  Created by Alex Lee on 2017-09-27.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit
import SQLite

enum MyError: Error {
    case FoundNil(String)
}

class HomeViewController: UIViewController {
    
    var db:Connection!
    let firstName = Expression<String>("Firstname")
    let lastName = Expression<String>("Lastname")
    let teamName = Expression<String>("teamName")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //load the database file
        let delegate = UIApplication.shared.delegate as! AppDelegate
        db = try! Connection(delegate.dbPath!)
        
        db.busyTimeout = 5.0
        
        let players = Table("Player")
        
        for player in try! db.prepare(players) {
            print("First name: \(player[firstName]), Last name: \(player[lastName]), team: \(player[teamName])")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
