//
//  ProfileViewController.swift
//  habit-tracker
//
//  Created by chloe ng on 4/26/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileView: UIView!
    private var user = User.default

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var numHabits: UILabel!
    
    var habits = [Habit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        username.text = user.name + "'s habits"
        updateHabitLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshHabits()
    }
    
    private func refreshHabits() {
        habits = Habit.getHabits()
        updateHabitLabels()
    }
    
    private func updateHabitLabels() {
        var completedHabits: Int = 0
        
        for habit in habits {
            if habit.isComplete ?? false {
                completedHabits += 1
            }
        }
        
        numHabits.text = "\(completedHabits) / \(habits.count)"
    }
}
