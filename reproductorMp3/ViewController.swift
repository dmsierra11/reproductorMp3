//
//  ViewController.swift
//  reproductorMp3
//
//  Created by XCode on 28/11/16.
//  Copyright © 2016 XCode. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    var player = AVAudioPlayer()
    var song : String = ""
    
    var songList: [String] = []
    var songPos: Int = -1;

    @IBOutlet var lblSongName: UILabel!
    
    @IBAction func btnPlay(_ sender: UIButton) {
        playSound(soundname: song)
    }
    
    @IBAction func btnRewind(_ sender: UIButton){
        if (songPos-1 != -1){
            songPos-=1
        }
        song = songList[songPos]
        lblSongName.text = song
        playSound(soundname: song)
    }
    
    @IBAction func btnForward(_ sender: UIButton){
        if (songPos+1 < songList.count){
            songPos+=1
        } else {
            songPos = 0
        }
        song = songList[songPos]
        lblSongName.text = song
        playSound(soundname: song)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        song = songList[songPos]
        lblSongName.text = song
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound (soundname: String) {
        let soundpathURL = documentsPath.appendingPathComponent(soundname)
        player = try! AVAudioPlayer(contentsOf: soundpathURL)
        player.prepareToPlay()
        player.play()
    }
    
}

