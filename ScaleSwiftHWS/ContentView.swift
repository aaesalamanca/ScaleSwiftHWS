//
//  ContentView.swift
//  ScaleSwiftHWS
//
//  Created by Alejandro Antonio Estornell Salamanca on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var fromDistance = 0.0
    @FocusState private var fromDistanceIsFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    TextField(
                        "From distance", value: $fromDistance, format: .number
                    )
                    .keyboardType(.decimalPad)
                    .focused($fromDistanceIsFocused)
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
