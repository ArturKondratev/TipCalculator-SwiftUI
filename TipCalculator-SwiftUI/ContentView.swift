//
//  ContentView.swift
//  TipCalculator-SwiftUI
//
//  Created by Артур Кондратьев on 29.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerRerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipeselection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipeValue = orderAmount / 100 * tipeselection
        let grandTotal = orderAmount + tipeValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField ("Введите сумму", text: $checkAmount).keyboardType(.numberPad)
                    Picker("Количество человек", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) человек")
                        }
                    }
                }
                
                Section (header: Text("Сколько чаевых хотите оставить?").bold()) {
                    Picker("Количество процентов", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section (header: Text("С каждого по").bold()) {
                    Text("\(totalPerRerson, specifier: "%.2f")").bold()
                }
            }
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
