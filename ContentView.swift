//
//  ContentView.swift
//  PW-Generator
//
//  Created by zlElo on 02.02.24.
//

import SwiftUI


struct ContentView: View {
    @State private var useLetters = false
    @State private var useNumbers = false
    @State private var useSpecial = false
    @State private var speed = 15.0
    @State private var isEditing = false
    @State private var generatedPassword: String = ""
    
    var body: some View {
        Grid {
            // Configuration of password
            Text("Configure:")
            Divider() // Divider for more overview
            VStack {
                Slider(
                    value: $speed,
                    in: 0...25,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                Text(verbatim: "\(speed.rounded())")
                    .foregroundColor(isEditing ? .red : .blue)
            }
            
            VStack {
                Toggle(isOn: $useLetters) {
                    Text("Letters")
                }
                Toggle(isOn: $useNumbers) {
                    Text("Numbers")
                }
                Toggle(isOn: $useSpecial) {
                    Text("Specials")
                }
            }
            
            VStack {
                Button(action: {
                    generatedPassword = Generate_password(useLetters: useLetters, useNumbers: useNumbers, useSpecial: useSpecial, speed: Int(speed.rounded()))
                }) {
                    Text("Generate")
                }
            }
            
            VStack {
                Divider()
            }

            // Generated password
            Text("Generated password:")
            GridRow {
                TextField("Generated Password", text: $generatedPassword)
            }
        }
    }
}

#Preview {
    ContentView()
}
