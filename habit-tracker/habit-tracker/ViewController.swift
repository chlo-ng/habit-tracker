//
//  ViewController.swift
//  habit-tracker
//
//  Created by chloe ng on 4/15/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var habits = [Habit]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitCell

        // Get the movie associated table view row
        let habit = habits[indexPath.row]

        // Set the text on the labels
//        cell.configure(with: habit, onCompleteButtonTapped: { [weak self] habit in
//            // i.
//            habit.save()
//            // ii.
//            self?.refreshHabits()
//        })
        cell.titleLabel.text = habit.title
        cell.progressView.progress = habit.progress

        // Return the cell for use in the respective table view row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            habits.remove(at: indexPath.row)
            // 3.
            Habit.save(habits)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib = UINib(nibName: "HabitCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "HabitCell")
        tableView.dataSource = self
        
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshHabits()
    }

    @IBAction func didTapCreateButton(_ sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    @IBAction func didTapComposeButton(_ sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ComposeSegue" {
            
            if let composeNavController = segue.destination as? UINavigationController,

                let createViewController = composeNavController.topViewController as? CreateViewController {

                createViewController.habitToEdit = sender as? Habit

                createViewController.onComposeHabit = { [weak self] habit in
                    habit.save()
                    self?.refreshHabits()
                }
            }
        }
    }
    
    private func refreshHabits() {
        // 1.
        var habits = Habit.getHabits()
        // 2.
//        habits.sort { lhs, rhs in
//            if lhs.isComplete && rhs.isComplete {
//                // i.
//                return lhs.completedDate! < rhs.completedDate!
//            } else if !lhs.isComplete && !rhs.isComplete {
//                // ii.
//                return lhs.createdDate < rhs.createdDate
//            } else {
//                // iii.
//                return !lhs.isComplete && rhs.isComplete
//            }
//        }
        // 3.
        self.habits = habits

        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1.
        tableView.deselectRow(at: indexPath, animated: false)
        // 2.
        let selectedHabit = habits[indexPath.row]
        // 3.
        performSegue(withIdentifier: "ComposeSegue", sender: selectedHabit)
    }
}


