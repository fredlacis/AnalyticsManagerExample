//
//  ContentView.swift
//  AnalyticsManagerExample
//
//  Created by Frederico Lacis de Carvalho on 03/02/21.
//

import SwiftUI

struct ContentView: View {
    
    let colors = ["Red", "Green", "Blue", "Tartan"]
    
    @State var sliderValue: Double = 0.0
    @State var selectedColor = 0
    
    // MARK: - Envent 1: Button tapped
    var Event1: some View {
        VStack {
            Button(action: {
                // Trigger button event
                AnalyticsManager.logEvent(.ButtonTapped)
            }) {
                Text("Trigger Button Event")
                    .foregroundColor(.white)
                    .padding(10)
            }
            .background(Color.blue)
            .cornerRadius(10)
            
            Text("Triggers an event called button_tapped with no parameters.")
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    // MARK: - Envent 2: With numeric paramenter
    var Event2: some View {
        VStack {
            Slider(
                value: $sliderValue,
                in: 0...100,
                step: 1,
                minimumValueLabel: Text("0").foregroundColor(.gray),
                maximumValueLabel: Text("100").foregroundColor(.gray)
            ) {
                Text("Slider Event")
            }
            
            Button(action: {
                // Trigger slider event
                AnalyticsManager.logEvent(.SliderNumber(number: Int(sliderValue)))
            }){
                Text("Trigger slider event  |  \(Int(sliderValue))")
                    .foregroundColor(.white)
                    .padding(10)
            }
            .background(Color.blue)
            .cornerRadius(10)
            
            Text("Triggers an event called slider_number with a numeric parameter.")
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    // MARK: - Envent 3: With string parameter
    var Event3: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("Please choose a color")) {
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            Button(action: {
                // Trigger picker event
                AnalyticsManager.logEvent(.PickerSelected(color: colors[selectedColor]))
            }){
                Text("Trigger picker event  |  \(colors[selectedColor])")
                    .foregroundColor(.white)
                    .padding(10)
            }
            .background(Color.blue)
            .cornerRadius(10)
            
            Text("Triggers an event called picker_selected with a string parameter.")
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    // MARK: - Envent 4: With int and string parameter
    var Event4: some View {
        VStack {
            Button(action: {
                // Trigger form event
                AnalyticsManager.logEvent(.FormSent(number: Int(sliderValue), color: colors[selectedColor]))
            }){
                Text("Trigger form event |  \(Int(sliderValue))  |  \(colors[selectedColor])")
                    .foregroundColor(.white)
                    .padding(10)
            }
            .background(Color.blue)
            .cornerRadius(10)
            
            Text("Triggers a single event called form_sent with both a numeric parameter and a string parameter.")
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Event1
                    
                    Divider()
                        .padding(.vertical)
                    
                    Event2
                    
                    Divider()
                        .padding(.vertical)
                    
                    Event3
                    
                    Divider()
                        .padding(.vertical)
                    
                    Event4
                    
                }
                .padding()
                .navigationBarTitle("Analytics Manager Example", displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
