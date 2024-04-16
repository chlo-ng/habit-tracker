//
//  ViewController.swift
//  habit-tracker
//
//  Created by chloe ng on 4/15/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var habits: [Habit] = [
        Habit(title: "eat meds", startDate: Date(), endDate: Date()),
        Habit(title: "journal daily", startDate: Date(), endDate: Date()),
        Habit(title: "sleep before 1am", startDate: Date(), endDate: Date())
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitCell

        // Get the movie associated table view row
        let habit = habits[indexPath.row]

        // Set the text on the labels
        cell.titleLabel.text = habit.title

        // Return the cell for use in the respective table view row
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib = UINib(nibName: "HabitCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "HabitCell")
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

