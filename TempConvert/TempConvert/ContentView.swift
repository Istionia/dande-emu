//
//  ContentView.swift
//  TempConvert
//
//  Created by Timothy on 08/09/2022.
//

import SwiftUI

struct TempConvertView: View {
    @State private var input = 0.0
    @State private var inputUnit = "Fahrenheit"
    @State private var outputUnit = "Celsius"
    
    var units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TempConvertView()
    }
}

