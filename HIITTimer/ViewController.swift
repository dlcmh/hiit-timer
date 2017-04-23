//
//  ViewController.swift
//  HIITTimer
//
//  Created by David Chin on 13/04/2017.
//  Copyright © 2017 David Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var seconds = 0
    var timer = Timer()

    @IBAction func startButtonTapped(_ sender: Any) {
        guard !timer.isValid else {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        disableStartButtonOnly()
        startButton.setTitle("Running", for: .normal)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        timer.invalidate()
        disablePauseButtonOnly()
        startButton.setTitle("Resume", for: .normal)
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        seconds = 0
        timerLabel.text = "\(seconds)"
        enableStartButtonOnly()
        startButton.setTitle("Start", for: .normal)
    }

    func updateTimer() {
        seconds += 1
        timerLabel.text = "\(seconds)"
    }
    
    func disableStartButtonOnly() {
        disable(button: startButton)
        enable(button: pauseButton)
        enable(button: resetButton)
    }

    func disablePauseButtonOnly() {
        disable(button: pauseButton)
        enable(button: startButton)
        enable(button: resetButton)
    }

    func enableStartButtonOnly() {
        enable(button: startButton)
        disable(button: pauseButton)
        disable(button: resetButton)
    }

    func enable(button: UIButton) {
        button.isEnabled = true
        button.alpha = 1.0
    }

    func disable(button: UIButton) {
        button.isEnabled = false
        button.alpha = 0.5
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableStartButtonOnly()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

