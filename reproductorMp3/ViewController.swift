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
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playSound(soundname: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound (soundname: String) {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(documentsPath.path)
        // Carga la lista de archivos del directorio documentos
        let fm = FileManager.default
        let allfiles = try? fm.contentsOfDirectory(atPath: documentsPath.path)
        print(allfiles!)
        
        let soundname = allfiles![0] // reproduce el primero
        let soundpathURL = documentsPath.appendingPathComponent(soundname)
        player = try! AVAudioPlayer(contentsOf: soundpathURL)
        player.prepareToPlay()
        player.play()
    }
    
}

