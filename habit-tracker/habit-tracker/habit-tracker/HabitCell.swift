//
//  HabitCell.swift
//  habit-tracker
//
//  Created by chloe ng on 4/15/24.
//

import UIKit

class HabitCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var completeButton: UIButton!
    
    var habit: Habit!
    var onCompleteButtonTapped: ((Habit) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    func getDateString(date: Date) -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    @IBAction func didTapCompleteButton(_ sender: UIButton) {
        
        if (habit.lastDate ?? Date() >= Date()) {
            habit.lastDate = Date()
            
            habit.isComplete = !(habit.isComplete ?? false)
            
            if (habit.isComplete ?? false) {
                habit.progress += 0.1
            }
            
            update()
            onCompleteButtonTapped?(habit)
        }
    }

    // Initial configuration of the task cell
    // 1. Set the main task property
    // 2. Set the onCompleteButtonTapped closure
    // 3. Update the UI for the given task
    func configure(with habit: Habit, onCompleteButtonTapped: ((Habit) -> Void)?) {
        // 1.
        self.habit = habit
        // 2.
        self.onCompleteButtonTapped = onCompleteButtonTapped
        // 3.
        update()
    }
    
    private func update() {
        // 4.
        completeButton.isSelected = habit.isComplete ?? false
        // 5.
        completeButton.tintColor = completeButton.isSelected ? .systemPurple : .tertiaryLabel
        progressView.progress = habit.progress
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }

}
