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
    
    var units = ["Celsius", "Fahrenheit", "Kelvin", "Rankine"]
    
    let temperatureFormatter = FloatingPointFormatStyle<Double>.someDouble.formatted()
    
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
                } header: {
                    Text("Choose your input unit")
                }
                
                Section {
                    Picker("Select output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose your output unit")
                }
                
                Section {
                    TextField("Temperature", value: $input; format: temperatureFormatter).keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TempConvertView()
    }
}
