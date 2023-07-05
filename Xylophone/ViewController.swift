//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        playsound(title: sender.currentTitle!)
        changeOpacity(sender: sender)
    }
    
    func changeOpacity(sender: UIButton){
        sender.alpha = 0.5
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
              sender.alpha = 1.0
          }
    }
    func playsound(title:String){
        guard let path = Bundle.main.path(forResource: title, ofType:"wav") else {
             return }
         let url = URL(fileURLWithPath: path)

         do {
             player = try AVAudioPlayer(contentsOf: url)
             player?.play()
             
         } catch let error {
             print(error.localizedDescription)
         }
    }
    

}

