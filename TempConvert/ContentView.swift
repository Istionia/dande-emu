//
//  ContentView.swift
//  TempConvert
//
//  Created by Timothy on 08/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputFigure = 0.0
    @State private var inputUnit = ["°C", "°F", "K", "°R"]
    @State private var outputUnit = ["°C", "°F", "K", "°R"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Temperature unit to convert from", selection: $inputUnit) {
                        ForEach(inputUnit, id: \.self){
                            Text($0, format: .number)
                        }
                    }.pickerStyle(.segmented)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

