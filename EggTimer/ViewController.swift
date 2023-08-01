//
//  ViewController.swift
//  EggTimer
//
//  Created by Alex  on 31.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	var player: AVAudioPlayer!
	
	let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
	//var secondsRemaining = 60 
	var eggTime = 0	
	var timer = Timer()
	
	var totalTime = 0
	var secondsPassed = 0
	
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBAction func hardnessSelected(_ sender: UIButton) {
		
		timer.invalidate()		
		let hardness = sender.currentTitle!
		totalTime = eggTimes[hardness]!
//		totalTime = eggTimes[hardness]! * secondsRemaining
		
		progressBar.progress = 0.0
		secondsPassed = 0
		titleLabel.text = hardness
		
		timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
	
	}
		@objc func update() {
			if secondsPassed < totalTime {
				secondsPassed += 1
				progressBar.progress = Float(secondsPassed) / Float(totalTime)
			} else {
				timer.invalidate()
				titleLabel.text = "Done!"
				playSound(soundName: "alarm_sound")
			}
	}
	
	func playSound(soundName: String) {
			 let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") 
				player = try! AVAudioPlayer(contentsOf: url!)
				player.play()
				
			}
	
	
	
}

