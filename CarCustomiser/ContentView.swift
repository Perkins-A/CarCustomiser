//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Perkins, Alexander (ABH) on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet{
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var brakesPackage = false
    @State private var gearboxPackage = false
    @State private var remainingFunds = 1000
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: {self.tiresPackage},
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.1
                    starterCars.cars[selectedCar].handling += 1
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.1
                    starterCars.cars[selectedCar].handling -= 1
                    remainingFunds += 500
                }
            }
        )
        let brakesPackageBinding = Binding<Bool> (
            get: {self.brakesPackage},
            set: { newValue in
                self.brakesPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 1
                    remainingFunds += 500
                }
            }
        )
        let gearboxPackageBinding = Binding<Bool> (
            get: {self.gearboxPackage},
            set: { newValue in
                self.gearboxPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.2
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.2
                    remainingFunds += 1000
                }
            }
        )
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        resetDisplay()
                        selectedCar += 1
                    })
                }
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(remainingFunds < 500 && !exhaustPackage)
                    Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(remainingFunds < 500 && !tiresPackage)
                    Toggle("Brakes Package (Cost: 500)", isOn: brakesPackageBinding)
                        .disabled(remainingFunds < 500 && !brakesPackage)
                    Toggle("Gearbox Package (Cost: 1000)", isOn: gearboxPackageBinding)
                        .disabled(remainingFunds < 1000 && !gearboxPackage)
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .baselineOffset(20)
            
        }
    }
    
    func resetDisplay() {
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        brakesPackage = false
        gearboxPackage = false
        starterCars = StarterCars()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
