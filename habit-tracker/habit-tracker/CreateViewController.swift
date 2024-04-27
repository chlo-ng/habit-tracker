//
//  CreateViewController.swift
//  habit-tracker
//
//  Created by chloe ng on 4/15/24.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var habitTitle: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var habitToEdit: Habit?
    var onComposeHabit: ((Habit) -> Void)? = nil


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let habit = habitToEdit {
            habitTitle.text = habit.title
            startDatePicker.date = habit.startDate
            endDatePicker.date = habit.endDate

            // 2.
            self.title = habit.title
        }
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        // 1.
        guard let title = habitTitle.text,
              !title.isEmpty
        else {
            // i.
            presentAlert(title: "Unable to create habit", message: "Make sure to add a title!")
            // ii.
            return
        }
        // 2.
        var habit: Habit
        // 3.
        if let editHabit = habitToEdit {
            // i.
            habit = editHabit
            // ii.
            habit.title = title
            habit.startDate = startDatePicker.date
            habit.endDate = endDatePicker.date
        } else {
            // 4.
            habit = Habit(title: title,
                        startDate: startDatePicker.date, endDate: endDatePicker.date)
        }
        // 5.
        onComposeHabit?(habit)
        // 6.
        dismiss(animated: true)
    }

    @IBAction func didTapCancelButton(_ sender: Any) {
        // Dismiss the TaskComposeViewController.
        dismiss(animated: true)
    }
    
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }

}
