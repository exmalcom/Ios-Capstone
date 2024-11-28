//
//  Home.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

// The Home view, which is the main screen of the app
struct Home: View {

    // PersistenceController instance to handle Core Data operations
    let persistence = PersistenceController.shared
    
    var body: some View {
        // A TabView container to hold multiple tabs
        TabView {
            // Menu view as the first tab
            Menu()
                // Injecting the managed object context from Core Data into the Menu view
                .environment(\.managedObjectContext, persistence.container.viewContext)
                // Setting the tab's label and icon
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            // UserProfile view as the second tab
            UserProfile()
                // Setting the tab's label and icon
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        // Hiding the back button in the navigation bar
        .navigationBarBackButtonHidden(true)
    }
}

// Preview provider to generate the preview of the Home view in Xcode
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
