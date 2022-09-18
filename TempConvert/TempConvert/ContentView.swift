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
    @FocusState private var amountIsFocused: Bool
    
    var units = ["Celsius", "Fahrenheit", "Kelvin", "Rankine"]
    
    let unitFormatter = FloatingPointFormatStyle<Double>.number
    
    var outputResult: Double {
        var outputResult = 0.0
        var inputKelvin = 0.0
        
        switch inputUnit {
            case "Celsius":
                inputKelvin = input + 273.15
                
            case "Fahrenheit":
                inputKelvin = (input - 32) * 5/9 + 273.15
            
            case "Rankine":
                inputKelvin = input * 5/9
            
            default:
                inputKelvin = input
        }
        
        switch outputUnit {
            case "Celsius":
                outputResult = inputKelvin - 273.15
            
            case "Fahrenheit":
                outputResult = (inputKelvin - 273.15) * 9/5 + 32
            
            case "Rankine":
                outputResult = inputKelvin * 1.8
            
            default:
                outputResult = inputKelvin
        }
        
        return outputResult
    }
    
    var body: some View {
        NavigationView {
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
                    TextField("Temperature", value: $input, format: unitFormatter).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Enter temperature value (in input unit)")
                }
                
                Section {
                    Text(outputResult, format: unitFormatter)
                } header: {
                    Text("Conversion result (in output unit)")
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
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
