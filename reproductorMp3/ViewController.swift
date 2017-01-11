//
//  ViewController.swift
//  reproductorMp3
//
//  Created by XCode on 28/11/16.
//  Copyright © 2016 XCode. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    var player = AVAudioPlayer()
    var song : String = ""
    
    var songList: [String] = []
    var songPos: Int = -1

    @IBOutlet var lblSongName: UILabel!
    
    @IBOutlet var playButton: UIButton!
    
    @IBAction func btnPlay(_ sender: UIButton) {
        if (!player.isPlaying){
            playSound()
            playButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
        } else {
            player.pause()
            playButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        }
        
    }
    
    @IBAction func btnRewind(_ sender: UIButton){
        if (songPos-1 != -1){
            songPos-=1
        }
        song = songList[songPos]
        lblSongName.text = song
        playSound()
    }
    
    @IBAction func btnForward(_ sender: UIButton){
        forwardSong()
    }
    
    func forwardSong(){
        if (songPos+1 < songList.count){
            songPos+=1
        } else {
            songPos = 0
        }
        song = songList[songPos]
        lblSongName.text = song
        playSound()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        song = songList[songPos]
        lblSongName.text = song
//        player.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initAudioPlayer()
    }
    
    func initAudioPlayer(){
        let soundpathURL = documentsPath.appendingPathComponent(song)
        player = try! AVAudioPlayer(contentsOf: soundpathURL)
        player.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound () {
        initAudioPlayer()
        player.prepareToPlay()
        player.play()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        forwardSong()
    }
    
}

