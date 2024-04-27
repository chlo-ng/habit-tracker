//
//  User.swift
//  habit-tracker
//
//  Created by chloe ng on 4/26/24.
//

import Foundation

struct User {
    var name: String
    var goalDate = Date()
    var habits = Habit.getHabits()
    
    static let `default` = User(name: "Jane")
}
