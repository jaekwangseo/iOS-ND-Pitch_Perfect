//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Jaekwang Seo on 5/26/16.
//  Copyright © 2016 Jaekwang Seo. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int {
        case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {
    
        switch (ButtonType(rawValue: sender.tag)!) {
        case ButtonType.Slow:
            playSound(rate: 0.5)
        case ButtonType.Fast:
            playSound(rate: 1.5)
        case ButtonType.Chipmunk:
            playSound(pitch: 1000)
        case ButtonType.Vader:
            playSound(pitch: -1000)
        case ButtonType.Echo:
            playSound(echo: true)
        case ButtonType.Reverb:
            playSound(reverb: true)
       
        }
        configureUI(PlayingState.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(PlayingState.NotPlaying)
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
