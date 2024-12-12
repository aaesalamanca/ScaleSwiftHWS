//
//  ContentView.swift
//  ScaleSwiftHWS
//
//  Created by Alejandro Antonio Estornell Salamanca on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var fromDistance: Double?
    @FocusState private var fromDistanceIsFocused: Bool

    private let units = ["m", "km", "ft", "yd", "mi"]
    @State private var fromUnit = "m"

    private let conversionRates = [
        "m-m": 1, "m-km": 0.001, "m-ft": 3.28084, "m-yd": 1.09361,
        "m-mi": 0.000621, "km-m": 1000, "ft-m": 0.3048, "yd-m": 0.9144,
        "mi-m": 1609.34,
    ]

    private var toDistance: Double {
        guard fromUnit != toUnit else {
            return fromDistance ?? 0
        }

        let meters =
            (fromDistance ?? 0) * conversionRates["\(fromUnit)-m"]!

        return meters * conversionRates["m-\(toUnit)"]!
    }

    @State private var toUnit = "m"

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    TextField(
                        "Distance", value: $fromDistance,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                    .focused($fromDistanceIsFocused)
                    Picker("From unit", selection: $fromUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("To") {
                    Text(toDistance, format: .number)
                    Picker("To unit", selection: $toUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("ScaleSwiftHWS")
            .toolbar {
                if fromDistanceIsFocused {
                    Button("Done") {
                        fromDistanceIsFocused.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
