//
//  Little_Lemon_AppApp.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

// The main entry point of the Little Lemon App
@main
struct Little_LemonApp: App {
    // Core Data persistence controller (commented out, unused in this file)
    // let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        // The main scene of the app, containing a WindowGroup
        WindowGroup {
            // Onboarding view is shown when the app launches
            Onboarding()
                // Executes a custom action when the Onboarding view appears
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                // This is used to close the keyboard when the user taps outside of a text field
        }
    }
}
