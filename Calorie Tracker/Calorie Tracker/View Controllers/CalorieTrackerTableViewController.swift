//
//  CalorieTrackerTableViewController.swift
//  Calorie Tracker
//
//  Created by Brandi Bailey on 1/5/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit
import CoreData
import SwiftChart

class CalorieTrackerTableViewController: UITableViewController {
    var calories = [CalorieCount]()

    var date = Date()

    var df: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.dateFormat = "h:mm:ss | LLL dd, yyyy"
        return formatter
    }


    @IBOutlet weak var chart: Chart!

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
        addToChart()
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
        cell.textLabel?.text = String(calories[indexPath.row].calories) + " Calories"
        cell.detailTextLabel?.text = df.string(from: calories[indexPath.row].timeStamp!)
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
            print(totalCalories!)
            let calorieCount = CalorieCount(context: CoreDataStack.context)
            calorieCount.calories = Int16(totalCalories!)!
            calorieCount.timeStamp = Date.currentTimeStamp
            CoreDataStack.saveContext()
            self.calories.append(calorieCount)
            print(calorieCount.timeStamp!)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func addToChart() {
        var chartArr: [Double] = []
        //Iterate through the calories array, pull out each value and push it into the array of doubles
        _ = calories.forEach { chartArr.append(Double($0.calories)) }
        print(chartArr)
        let series = ChartSeries(chartArr)
        chart.add(series)

    }
}

extension Date {
    static var currentTimeStamp: Date {
        return Date()
    }
}
