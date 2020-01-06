//
//  CalorieTrackerTableViewController.swift
//  Calorie Tracker
//
//  Created by Brandi Bailey on 1/5/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit
import CoreData

class CalorieTrackerTableViewController: UITableViewController {
    var calories = [CalorieCount]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<CalorieCount> = CalorieCount.fetchRequest()
        
        do {
           let calories = try CoreDataStack.context.fetch(fetchRequest)
            self.calories = calories
            self.tableView.reloadData()
        } catch {
            print(error)
        }

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
        cell.textLabel?.text = String(calories[indexPath.row].calories)
        cell.detailTextLabel?.text = "\(calories[indexPath.row].timeStamp)"

        return cell
    }
    // MARK: - Methods

    @IBAction func addCalorieCountTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Calories", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Total Calories"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            let totalCalories = alert.textFields?.first?.text
            let timeStamp = Date.self
            print(totalCalories)
            print(timeStamp)
            let calorieCount = CalorieCount(context: CoreDataStack.context)
            calorieCount.calories = Int16(totalCalories!)!
            CoreDataStack.saveContext()
            self.calories.append(calorieCount)
            print(calorieCount)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func chartCals() {
        
        var chartCalArr: [Double] = []
        
        
    }
}
