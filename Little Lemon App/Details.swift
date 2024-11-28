//
//  Details.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

// Define a struct to represent the details view for an item
struct Details: View {
    
    // Declare the properties that will be passed into this view
    var title: String
    var price: String
    var image: String
    var description: String
    
    var body: some View {
        
        // ScrollView allows the content to be scrollable
        ScrollView {
            VStack {
                // Horizontal stack (HStack) for title and price side by side
                HStack {
                    // Display the title with bold font and custom padding and color
                    Text(title)
                        .font(Font.system(size: 16, weight: .bold))
                        .padding()
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    
                    // Display the price with bold font and custom padding and color
                    Text("$\(price)")
                        .font(Font.system(size: 16, weight: .bold))
                        .padding()
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                }
                
                // Display the description text
                Text(description)
                
                // AsyncImage loads the image asynchronously from the provided URL
                AsyncImage(url: URL(string: image))
                    .frame(maxWidth: 300, maxHeight: 300) // Restrict the image's max size
                
                // AsyncImage with a phase to handle different states: empty, success, failure
                AsyncImage(url: URL(string: image)) { phase in
                    switch phase {
                    case .empty:
                        // Display an icon while the image is loading
                        Image(systemName: "exclamationmark.icloud")
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        
                    case .success(let image):
                        // Display the loaded image, resized to fit
                        image.resizable()
                            .scaledToFit()
                        
                    case .failure(_):
                        // Display an icon if the image fails to load
                        Image(systemName: "exclamationmark.icloud")
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        
                    @unknown default:
                        // Default case in case of unknown states
                        Image(systemName: "exclamationmark.icloud")
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    }
                }
                .frame(width: 200, height: 200) // Set a fixed size for the image
                
            }
        }
    }
}

// Preview of the Details view for testing in SwiftUI canvas
struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(title: "title", price: "price", image: "image", description: "description")
    }
}
