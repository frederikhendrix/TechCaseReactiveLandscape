//
//  ContentView.swift
//  TechCaseReactiveLandscape
//
//  Created by Rik Hendrix on 16/02/2023.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    @ObservedObject var player = AudioPlayer(name: "KickDrumLoop", type: "aif", volume: 0.6758675867587)
    
    
    let movementManager = CMMotionManager()
    
    @State var speedVolume: Float = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action:{
                self.player.player.play()
                print("button is pressed")
            }){
                Text("play audio")
            }.foregroundColor(.blue).background(.white)
            Button(action:{
                movementManager.startAccelerometerUpdates()
                if let accelerometerData = movementManager.accelerometerData {
                    player.playerAudio(name: "KickDrumLoop", type: "aif", volume: Float(accelerometerData.acceleration.x))
                    print("this is the speed data \(accelerometerData.acceleration.x)")
                    speedVolume = Float(accelerometerData.acceleration.x)
                }
            }){
                Text("Movement Meter")
            }
                        
            Text("Volume of sound is set to \(speedVolume)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
