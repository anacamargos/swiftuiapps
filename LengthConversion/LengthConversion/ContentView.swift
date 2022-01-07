//
//  ContentView.swift
//  LengthConversion
//
//  Created by Ana Leticia Camargos on 07/01/22.
//

import SwiftUI

enum LengthConversion: String, CaseIterable {
    case meters
    case kilometers
    case feet
    case yard
    case miles
}

struct ContentView: View {
    
    @State private var numberInput = 0.0
    @State private var inputUnit = LengthConversion.meters
    @State private var outputUnit = LengthConversion.meters
    @FocusState private var keyboardIsFocused: Bool
    
    var conversionResult: Double {
        var userInputInMeters = 0.0
        switch inputUnit {
        case .meters:
            userInputInMeters = numberInput
        case .kilometers:
            userInputInMeters = numberInput * 1000
        case .feet:
            userInputInMeters = numberInput / 3.281
        case .yard:
            userInputInMeters = numberInput / 1.094
        case .miles:
            userInputInMeters = numberInput * 1609
        }
        
        var output = 0.0
        switch outputUnit {
        case .meters:
            output = userInputInMeters
        case .kilometers:
            output = userInputInMeters / 1000
        case .feet:
            output = userInputInMeters * 3.281
        case .yard:
            output = userInputInMeters * 1.094
        case .miles:
            output = userInputInMeters / 1609
        }
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Number input", value: $numberInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                    Picker("Choose the input unit", selection: $inputUnit) {
                        ForEach(LengthConversion.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text(conversionResult.formatted())
                    Picker("Choose the output unit", selection: $outputUnit) {
                        ForEach(LengthConversion.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("LengthConversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        keyboardIsFocused = false
                    }
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
