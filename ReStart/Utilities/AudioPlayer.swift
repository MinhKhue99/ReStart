//
//  AudioPlayer.swift
//  ReStart
//
//  Created by Phạm Minh Khuê on 15/08/2022.
//

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?
func playAudio(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file")
        }
    }

}
