//
//  TamagotchiAppTests.swift
//  TamagotchiAppTests
//
//  Created by Jin Li, David (MAG) on 20/01/2022.
//

import XCTest
@testable import TamagotchiApp

class TamagotchiAppTests: XCTestCase {
    // Testing hunger after eating snacks
    
    func testEatSnackReducesHungerBy1() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        tamagotchi.hunger = 5
        tamagotchi.eatSnack()
        //assert
        XCTAssertEqual(tamagotchi.hunger,4)
    }

    func testEatSnackWhenHungerIs0() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        tamagotchi.hunger = 0
        tamagotchi.eatSnack()
        //assert
        XCTAssertEqual(tamagotchi.hunger,0)
    }
    
    //Testing weight after eating snacks
    
    func testWeightAfterEatSnackIncreasesBy2() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        tamagotchi.weight = 0
        tamagotchi.eatSnack()
        //assert
        XCTAssertEqual(tamagotchi.weight,2)
    }
    
    func testWeightAfterEatSnackWhenHungerIs0() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        tamagotchi.weight = 0
        tamagotchi.eatSnack()
        //assert
        XCTAssertEqual(tamagotchi.weight,0)
    }
    
    //Testing happiness after playing games
    
    func testHappinessAfterPlayGamesIncreasesBy1() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        tamagotchi.happiness = 0
        tamagotchi.playGames()
        //assert
        XCTAssertEqual(tamagotchi.happiness,1)
    }
    
    func testDisplayStatsMethodDisplaysAllAttributes() {
        let tamagotchi = Tamagotchi()
        let expected = """
            Hunger: 5
            Weight: 4lb
            Happiness: 3
        """
        XCTAssertEqual(tamagotchi.displayStats(),expected)
    }

}
