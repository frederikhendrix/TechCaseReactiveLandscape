//
//  ContentView.swift
//  TechCaseReactiveLandscape
//
//  Created by Rik Hendrix on 16/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var player = AudioPlayer(name: "KickDrumLoop", type: "aif")

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Tap Me"){
                print("button tap")
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
