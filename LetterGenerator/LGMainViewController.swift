//
//  LGMainViewController.swift
//  LetterGenerator
//
//  Created by Rafael Valer on 2/17/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class LGMainViewController: UIViewController {

    @IBOutlet weak var lblLetter: UILabel!
    @IBOutlet weak var btnRandomizeLetter: UIButton!
    
    var loopControl = 0
    var timerLetterChange = NSTimer()
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Z", "W", "Y"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func actionRandomizeLetterClicked(sender: AnyObject) {
        //26
        timerLetterChange = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "updateLetter", userInfo: nil, repeats: true)
        
    }
    
    func updateLetter(){
        self.loopControl++
        if(self.loopControl < 8) {
            let random = Int(arc4random_uniform(26))
            self.lblLetter.text = letters[random]
        }else{
            self.timerLetterChange.invalidate()
            self.loopControl = 0
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
