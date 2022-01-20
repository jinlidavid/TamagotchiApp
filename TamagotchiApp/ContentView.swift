//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Jin Li, David (MAG) on 20/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tamagotchi = Tamagotchi()
    var body: some View {
        Form{
            VStack(alignment: .leading, spacing: 20) {
                Text(tamagotchi.displayStats())
                Button("Feed", action: {tamagotchi.eat()})
                Button("Play", action: {tamagotchi.playGames()})
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
