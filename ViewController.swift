//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//  Exercised on by Thomas Frey

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //  Button link to InterfaceBuilder. Func w/ parameters to play sound
    @IBAction func keyPressed(_ sender: UIButton) {
        //Play sound and dim button opacity by half
        playSound(soundName: sender.currentTitle!)
        sender.alpha = 0.5
        
        //Pump up opacity after two seconds w/ this func
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        //No hardcoded Key sound. Dynamic now cuz of parameter
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
