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
    @IBOutlet weak var slider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("slider value: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
        @IBAction func showAlert() {
            
            let message = ("current value is \(currentValue)")
            
            let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
    }


}

