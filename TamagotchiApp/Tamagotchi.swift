//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Jin Li, David (MAG) on 20/01/2022.
//

import Foundation

class Tamagotchi:ObservableObject {
    @Published var hunger: Int
    @Published var weight: Int
    @Published var happiness: Int
    
    init() {
        self.hunger = 5
        self.weight = 4
        self.happiness = 3
    }
    
    func eat() {
        if hunger > 0 {
            hunger -= 1
            weight += 2
        }
    }
    
    func playGames() {
        happiness += 1
    }
    
    func displayStats() -> String {
        return """
            Hunger: \(hunger)
            Weight: \(weight)lb
            Happiness: \(happiness)
            """
    }
}
