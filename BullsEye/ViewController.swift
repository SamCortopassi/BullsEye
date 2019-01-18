//
//  ViewController.swift
//  BullsEye
//
//  Created by Samantha Cortopassi on 1/17/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var points = 0
    var score = 0
    var round = 0
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }

    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    let difference = (sliderValue - target value)
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("slider value: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
        @IBAction func showAlert() {
            var difference = abs(currentValue - targetValue)
            let points = 100 - difference
            
            score += points
            
            let title: String
            if difference == 0 {
                title = "perfect"
            } else if difference < 5 {
                title = "within 5"
            } else if difference < 10 {
                title = "over 10"
            } else {
                title = "way off"
            }
            
            let message = ("current value is \(currentValue)" + "\n the target is \(targetValue)" + "\n points \(difference)")
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
            
            alert.addAction(action)
                
            
            
            present(alert, animated: true, completion: nil)
            
            startNewRound()
            
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

