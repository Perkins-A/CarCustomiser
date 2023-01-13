//
//  Car.swift
//  CarCustomiser
//
//  Created by Perkins, Alexander (ABH) on 12/01/2023.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
Make: \(make)
Model: \(model)
Top Speed: \(topSpeed)mph
Acceleration (0-60): \(acceleration)s
Handling: \(handling)
"""
    }
    
}
