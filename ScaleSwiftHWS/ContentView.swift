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
        "m-km": 0.001, "m-ft": 3.28084, "m-yd": 1.09361, "m-mi": 0.000621,
        "km-m": 1000, "km-ft": 3280.84, "km-yd": 1093.61, "km-mi": 0.621,
        "ft-m": 0.3048, "ft-km": 0.000305, "ft-yd": 0.333333, "ft-mi": 0.000189,
        "yd-m": 0.9144, "yd-km": 0.000914, "yd-fy": 3, "yd-mi": 0.000568,
        "mi-m": 1609.34, "mi-km": 1.69034, "mi-ft": 5280, "mi-yd": 1760,
    ]
    private var toDistance: Double {
        (fromDistance ?? 0) * (conversionRates["\(fromUnit)-\(toUnit)"] ?? 1)
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
