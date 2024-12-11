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

    private var units = ["m", "km", "ft", "yd", "mi"]
    @State private var fromUnit = "m"

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    HStack {
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

                }
                Section("To") {

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
