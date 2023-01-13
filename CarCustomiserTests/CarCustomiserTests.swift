//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Perkins, Alexander (ABH) on 12/01/2023.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesACarWithAllAttributesSet() {
        // arrange
        // act
        let car = Car(make: "Porsche", model: "911", topSpeed: 130, acceleration: 6.8, handling: 2)
        // assert
        XCTAssertEqual(car.make, "Porsche")
        XCTAssertEqual(car.model, "911")
        XCTAssertEqual(car.topSpeed, 130)
        XCTAssertEqual(car.acceleration, 6.8)
        XCTAssertEqual(car.handling, 2)
    }

    func testDisplayStatsMethodReturnAStringOfCorrectFormatAndContent() {
        // arrange
        let expected = """
Make: Porsche
Model: 911
Top Speed: 130mph
Acceleration (0-60): 6.8s
Handling: 2
"""
        
        // act
        let car = Car(make: "Porsche", model: "911", topSpeed: 130, acceleration: 6.8, handling: 2)
        let displayedStats: String = car.displayStats()
        
        // assert
        XCTAssertEqual(displayedStats, expected)
    }
}
