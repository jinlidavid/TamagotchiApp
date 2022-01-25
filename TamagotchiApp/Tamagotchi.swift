//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Jin Li, David (MAG) on 20/01/2022.
//

import Foundation

class Tamagotchi:ObservableObject {
    @Published var isDead: Bool
    @Published var hunger: Int
    @Published var weight: Int
    @Published var happiness: Int
    @Published var isIll: Bool
    @Published var age: Int
    //Toilet-related
    @Published var needsToilet: Bool
    @Published var cleanUpRequired: Bool
    @Published var pooCounter: Int
    
    init() {
        self.isDead = false
        self.hunger = 5
        self.weight = 4
        self.happiness = 3
        self.isIll = false
        self.needsToilet = false
        self.pooCounter = 0
        self.cleanUpRequired = false
        self.age = 0
    }
    
    func eatSnack() {
        if hunger > 0 {
            hunger -= 1
            weight += 2
            happiness += 1
        }
    }
    
    func eatMeal() {
        if hunger > 0 {
            hunger -= 1
            weight += 1
        }
    }
    
    func playGames() {
        happiness += 1
    }
    
    func toiletCheck() {
        if needsToilet == true {
            pooCounter += 1
            cleanUpRequired = true
        } else {
            needsToilet = true
        }
    }
    
    func cleanUp() {
        if pooCounter > 0{
            pooCounter -= 1
        }
        if pooCounter == 0{
            cleanUpRequired = false
        }
        needsToilet = false
    }
    
    func ageUp() {
        age += 1
    }
    
    func checkHealth() {
        let chanceOfDeath = Int.random(in: 1..<100)
        if chanceOfDeath >= 98 {
            isDead = true
        }
    }
    
    func displayStats() -> String {
        return """
            Alive: \(isDead ? "No" : "Yes")
            Age: \(age) years
            Hunger: \(hunger)
            Weight: \(weight)lb
            Happiness: \(happiness)
            Toilet Status: \(needsToilet ? "Needed" : "Not required")
            Mess created: \(pooCounter)
            """
    }
}
