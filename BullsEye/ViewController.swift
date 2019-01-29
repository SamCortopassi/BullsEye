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
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "bullseye")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "bullseye dark")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "button 2")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "Button Gray")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
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
            var points = 100 - difference
            
            
            let title: String
            if difference == 0 {
                title = "perfect"
                points += 100
            } else if difference < 5 {
                title = "within 5"
                if difference == 1 {
                points += 50
                }
            } else if difference < 10 {
                title = "over 10"
                points += 1
            } else {
                title = "way off"
            }
            
            score += points

            
            let message = ("current value is \(currentValue)" + "\n the target is \(targetValue)" + "\n points \(difference)")
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "awesome", style: .default, handler: {
                action in
                self.startNewRound()
            })
            
            alert.addAction(action)
                
            
            
            present(alert, animated: true, completion: nil)
            
            
    }
    
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

