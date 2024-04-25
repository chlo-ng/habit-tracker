//
//  Habits.swift
//  habit-tracker
//
//  Created by chloe ng on 4/15/24.
//

import Foundation


struct Habit: Codable, Equatable {
    
    var title: String
    var startDate: Date
    var endDate: Date
    
    init(title: String, startDate: Date = Date(), endDate: Date = Date()) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
    
    var progress: Float = 0
    var id: String = UUID().uuidString
    
}

extension Habit {

    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ habits: [Habit]) {

        // TODO: Save the array of tasks
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(habits)
        defaults.set(encodedData, forKey: "habits")
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getHabits() -> [Habit] {
        
        // TODO: Get the array of saved tasks from UserDefaults
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "habits") {
            let decodedHabits = try! JSONDecoder().decode([Habit].self, from: data)
            return decodedHabits
        } else {
            return [] // 👈 replace with returned saved tasks
        }
    }

    // Add a new task or update an existing task with the current task.
    func save() {

        // TODO: Save the current task
        var habits = Habit.getHabits()
        
        // Check if the task already exists in the array
        if let index = habits.firstIndex(where: { $0.id == self.id }) {
            // Update the existing task
            habits.remove(at: index)
            habits.insert(self, at: index)
        } else {
            // Add the new task
            habits.append(self)
        }
       
        Habit.save(habits)
    }
}

