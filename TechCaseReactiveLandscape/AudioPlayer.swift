//
//  AudioPlayer.swift
//  TechCaseReactiveLandscape
//
//  Created by Rik Hendrix on 28/02/2023.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    
    var player = AVAudioPlayer()
    
    init(name: String, type: String, volume: Float = 1){
        print("intialised")
        if let url = Bundle.main.url(forResource: name, withExtension: type) {
            print("success audio file: \(name) and volume \(volume)")
            
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                player.setVolume(volume, fadeDuration: 0)
            }catch{
                print("error getting audio \(error.localizedDescription)")
            }
        }else{
            print("failed")
        }
    }
    
    func playerAudio(name: String, type: String, volume: Float = 1){
        print("intialised")
        if let url = Bundle.main.url(forResource: name, withExtension: type) {
            print("success audio file: \(name) and volume \(volume)")
            
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                player.setVolume(volume, fadeDuration: 0)
            }catch{
                print("error getting audio \(error.localizedDescription)")
            }
        }else{
            print("failed")
        }
        
        player.play()
    }
}
