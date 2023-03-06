//
//  ContentView.swift
//  TechCaseReactiveLandscape
//
//  Created by Rik Hendrix on 16/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var player = AudioPlayer(name: "RickRollSound", type: "mp3", volume: 0.1)

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
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
