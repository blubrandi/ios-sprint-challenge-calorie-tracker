//
//  CalorieTrackerTableViewController.swift
//  Calorie Tracker
//
//  Created by Brandi Bailey on 1/5/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit

class CalorieTrackerTableViewController: UITableViewController {
    
    var calories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
        return cell
    }
    
    // MARK: - Methods

    @IBAction func addCalorieCountTapped(_ sender: Any) {
        
    }
}

