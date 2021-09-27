//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timeLeft = 0
    var totalTime = 0
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        timeLeft = 0
        let hardness = sender.currentTitle!
        labelEggs.text = hardness
        totalTime = eggTimes[hardness]!// * 60
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerEggs), userInfo: nil, repeats: true)

    }
    @IBOutlet weak var labelEggs: UILabel!
    
    @objc func onTimerEggs() {
        if timeLeft < totalTime {
            let percent = Float(timeLeft) / Float(totalTime)
            progressBar.progress = percent
            timeLeft += 1
            
        } else {
            progressBar.progress = 1.0
            timer.invalidate()
            labelEggs.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    // EDIT
    let myTotalTime = 10.0
    var myTimeLeft = 0.0
    var startBySlider = false
    var calcSlider = false
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func startPressed(_ sender: UIButton) {
        startSlider()
    }
    @IBAction func slider(_ sender: UISlider) {
        startBySlider = true
    }
    
    func startSlider() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerSlider), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerSlider() {
        if startBySlider && !calcSlider {
            myTimeLeft = Double(slider.value) * myTotalTime
            calcSlider = true
        }
        
        if myTimeLeft < myTotalTime {
            let percent = Float(myTimeLeft) / Float(myTotalTime)
            slider.value = percent
            myTimeLeft += 1
        }  else {
            slider.value = 1.0
            timer.invalidate()
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            // AT THE END
            calcSlider = false
            startBySlider = false
            myTimeLeft = 0
        }
    }
    
}


