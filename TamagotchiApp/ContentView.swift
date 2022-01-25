//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Jin Li, David (MAG) on 20/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tamagotchi = Tamagotchi()
    @State private var pooCounter = 0
    @State private var timePassed = 0
    let timer = Timer.publish(every:1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("\(timePassed)")
                .onReceive(timer) {_ in
                    if !tamagotchi.isDead {
                        self.timePassed += 1
                        if self.timePassed % 15 == 0 {
                            tamagotchi.toiletCheck()
                        }
                        if self.timePassed % 30 == 0 {
                            tamagotchi.ageUp()
                        }
                        tamagotchi.checkHealth()
                    }
                }
            
            Form{
                VStack(alignment: .leading, spacing: 20) {
                    Text(tamagotchi.displayStats())
                }
                Section {
                    Button("Feed (Snack)", action: {tamagotchi.eatSnack()})
                    Button("Feed (Meal)", action: {tamagotchi.eatMeal()})
                    Button("Play", action: {tamagotchi.playGames()})
                    Button("Clean Up", action: {tamagotchi.cleanUp()})
                }
                .disabled(tamagotchi.isDead)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
