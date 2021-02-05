//
//  AnalyticsManagerExampleApp.swift
//  AnalyticsManagerExample
//
//  Created by Frederico Lacis de Carvalho on 03/02/21.
//

import SwiftUI
import Firebase

@main
struct AnalyticsManagerExampleApp: App {
    
    // Libraries configuration
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
