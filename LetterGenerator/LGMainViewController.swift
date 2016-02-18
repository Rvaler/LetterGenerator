//
//  LGMainViewController.swift
//  LetterGenerator
//
//  Created by Rafael Valer on 2/17/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class LGMainViewController: UIViewController {

    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblLetter: UILabel!
    @IBOutlet weak var btnRandomizeLetter: UIButton!
    @IBOutlet weak var btnPauseResume: UIButton!
    
    var loopControl = 0
    var time = 120
    var timerSeconds = NSTimer()
    var timerLetterChange = NSTimer()
    var isPaused = true
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Z", "W", "Y"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnPauseResume.enabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func actionPauseResumeClicked(sender: AnyObject) {
        if(isPaused) {
            self.btnPauseResume.setTitle("Pause", forState: .Normal)
            self.btnPauseResume.tintColor = UIColor.redColor()
            isPaused = false
            timerSeconds = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        } else {
            self.btnPauseResume.setTitle("Resume", forState: .Normal)
            self.btnPauseResume.tintColor = UIColor.blueColor()
            isPaused = true
            self.timerSeconds.invalidate()
        }
    }
    
    @IBAction func actionRandomizeLetterClicked(sender: AnyObject) {
        //26
        self.timerSeconds.invalidate()
        self.btnRandomizeLetter.enabled = false
        self.btnPauseResume.enabled = true
        self.isPaused = false
        self.time = 120
        self.calculateTime(time)
        timerSeconds = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        timerLetterChange = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "updateLetter", userInfo: nil, repeats: true)
    }
    
    func calculateTime(time: Int){
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        self.lblTimer.text = String(format:"%02i:%02i", minutes, seconds)
    }
    
    func updateTimer(){
        if(self.time != 0) {
            self.time--
            self.calculateTime(self.time)
        }else{
            self.btnPauseResume.enabled = false
            self.timerSeconds.invalidate()
        }
    }
    
    func updateLetter(){
        self.loopControl++
        if(self.loopControl < 8) {
            let random = Int(arc4random_uniform(26))
            self.lblLetter.text = letters[random]
        }else{
            self.timerLetterChange.invalidate()
            self.loopControl = 0
            self.btnRandomizeLetter.enabled = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
