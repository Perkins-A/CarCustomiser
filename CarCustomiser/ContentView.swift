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
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
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
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.1
                    starterCars.cars[selectedCar].handling -= 1
                }
            }
        )
        let brakesPackageBinding = Binding<Bool> (
            get: {self.brakesPackage},
            set: { newValue in
                self.brakesPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                } else {
                    starterCars.cars[selectedCar].handling -= 1
                }
            }
        )
        let gearboxPackageBinding = Binding<Bool> (
            get: {self.gearboxPackage},
            set: { newValue in
                self.gearboxPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.2
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.2
                }
            }
        )
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(starterCars.cars[selectedCar].displayStats())")
                Button("Next Car", action: {
                    selectedCar += 1
                })
            }
            Section {
                Toggle("Exhaust Prackage", isOn: exhaustPackageBinding)
                Toggle("Tires Package", isOn: tiresPackageBinding)
                Toggle("Brakes Prackage", isOn: brakesPackageBinding)
                Toggle("Gearbox Prackage", isOn: gearboxPackageBinding)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
