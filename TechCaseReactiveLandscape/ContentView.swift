//
//  ContentView.swift
//  TechCaseReactiveLandscape
//
//  Created by Rik Hendrix on 16/02/2023.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    @ObservedObject var player = AudioPlayer(name: "KickDrumLoop", type: "aif")
    
    @State private var selection = "KickDrumLoop"
    
    let sounds = ["KickDrumLoop", "ChimeMelodyLoop", "RingFirstFourLoop", "RingLastFourLoop", "ShakerLoop", "SilenceLoop", "SineMelodyLoop", "SinePulseLoop", "SnareDrumLoop", "SynthPulseLoop"]
    
    let movementManager = CMMotionManager()
    
    @State var speedVolume: Float = 0
    
    var body: some View {
        VStack{
            VStack {
                Picker("Select a paint color", selection: $selection) {
                        ForEach(sounds, id: \.self){
                            Text($0)
                        }
                }
                .pickerStyle(.menu)
                Button(action:{
                    movementManager.startAccelerometerUpdates()
                    if let accelerometerData = movementManager.accelerometerData {
                        player.playerAudio(name: selection, type: "aif", volume: Float(accelerometerData.acceleration.x))
                        print("this is the speed data \(accelerometerData.acceleration.x)")
                        speedVolume = Float(accelerometerData.acceleration.x)
                    }
                    print(selection)
                }){
                    Text("Play Audio")
                }
                            
                
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
