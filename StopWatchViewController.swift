//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Shelan on 2/11/19.
//  Copyright © 2019 Shelan. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController
{
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        stopButton.isEnabled = false
        startButton.isEnabled = true
        
    }
    
    
    @IBAction func resetDidTap(_ sender: Any)
    {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00"
        resetButton.isEnabled = false
        stopButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @IBAction func pauseDidTap(_ sender: Any)
    {
        resetButton.isEnabled = true
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    
    @IBAction func startDidTap(_ sender: Any)
    {
        //if timer is not running, run function
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            resetButton.isEnabled = true
            stopButton.isEnabled = true
            startButton.isEnabled = false
        }
        
    }
    
    //MARK - Helper method
    //#selector is syntax in obj C, change func runTimer() -> @objc func runTimer()
    
    @objc func runTimer() {
        counter += 0.1
        timerLabel.text = "\(counter)"
        //HH:MM:SS
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString)"
        
    }
}
