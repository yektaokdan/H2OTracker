//
//  ViewController.swift
//  H2OTracker
//
//  Created by yekta on 6.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var waterHeightLevelContstraint: NSLayoutConstraint!
    @IBOutlet weak var button200UI: UIButton!
    @IBOutlet weak var button500UI: UIButton!
    @IBOutlet weak var button800UI: UIButton!
    let waterStore = DataStore()
    let targetAmount = 2700.0
    var waterAmount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCornerSetup()
        updateAppereance()
    }
    func buttonCornerSetup(){
        button200UI.layer.cornerRadius = 30
        button500UI.layer.cornerRadius = 30
        button800UI.layer.cornerRadius = 30
    }
    
    @IBAction func tap800(_ sender: Any) {
        waterAmount = 800
        waterStore.addWater(amount: waterAmount)
        updateAppereance()
    }
    @IBAction func tap200(_ sender: Any) {
        waterAmount = 200
        waterStore.addWater(amount: waterAmount)
        updateAppereance()
    }
    @IBAction func tap500(_ sender: Any) {
        waterAmount = 500
        waterStore.addWater(amount: waterAmount)
        updateAppereance()
    }
    func updateWaterLevel(amount: Double) {
        let screenHeight = Double(view.frame.size.height)
        let ratio = amount / targetAmount
        let calculatedHeight = screenHeight * ratio
        waterHeightLevelContstraint.constant = CGFloat(calculatedHeight)
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    func updateLabels(amount: Double) {
        let amountToTarget = (targetAmount - amount) / 1000
        
        if amount < targetAmount {
            let subtitleText = String(format: "You need to drink \n%g liters more water today.", amountToTarget)
            subtitleLabel.text = subtitleText
            
            if amount == 0 {
                titleLabel.text = "Hi! \nDid you drink water today?"
            } else {
                titleLabel.text = "Congratulations! \nYou're on the right track."
            }
        } else {
            titleLabel.text = "Wonderful! \nYou took good care of yourself."
            subtitleLabel.text = "You have met all the amount of water your body needs today."
        }
    }
    func updateAppereance() {
        let currentWaterAmount = waterStore.getCurrentAmount()
        updateLabels(amount: currentWaterAmount)
        updateWaterLevel(amount: currentWaterAmount)
    }
}


