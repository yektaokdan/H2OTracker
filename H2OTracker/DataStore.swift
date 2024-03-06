//
//  DataStore.swift
//  H2OTracker
//
//  Created by yekta on 6.03.2024.
//

import Foundation
class DataStore{
    let defaults = UserDefaults.standard
    var currentDay: Int {
        let now = Date()
        let day = Calendar.current.component(.day, from: now)
        return day
    }
    func getCurrentAmount() -> Double {
        let savedAmount = defaults.double(forKey: "currentAmount")
        return savedAmount
    }
    func getLatestUpdateDay() -> Int {
        let latestDay = defaults.integer(forKey: "latestUpdateDay")
        return latestDay
    }
    func addWater(amount: Double) {
        let currentAmount = getCurrentAmount()
        let newAmount = currentAmount + amount
        
        defaults.set(newAmount, forKey: "currentAmount")
        defaults.set(currentDay, forKey: "latestUpdateDay")
    }
    init() {
        let latestUpdateDay = getLatestUpdateDay()
        if latestUpdateDay != currentDay {
            defaults.set(0, forKey: "currentAmount")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
