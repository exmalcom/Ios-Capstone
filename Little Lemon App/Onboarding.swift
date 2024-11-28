//
//  Onboarding.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
// 

import SwiftUI

// Define constants for storing user data in UserDefaults
let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

// Onboarding view for user registration and navigation
struct Onboarding: View {
    // State variables for storing user input
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        // NavigationView to allow navigation to other views
        NavigationView {
            VStack {
                // Logo image displayed at the top of the screen with some padding
                Image("Logo")
                    .padding(.bottom, 5)
                
                // Container for the introductory section of the app
                ZStack {
                    // Background color for the top section
                    Rectangle().foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    VStack {
                        // Top header with the app name "Little Lemon"
                        HStack {
                            Text("Little Lemon")
                                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255)) // Yellow color for the text
                                .font(Font.custom("Georgia", size: 40)) // Custom font with size 40
                                .bold() // Bold text
                                .padding([.leading], 20) // Padding on the left
                            Spacer() // Spacer to push content to the left
                        }
                        .frame(height: 45)
                        
                        // Subheader with restaurant description and a Hero image
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Chicago")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255)) // Light gray color
                                    .font(Font.custom("Georgia", size: 30)) // Custom font for the city name
                                    .fontWeight(.medium) // Medium weight font
                                    .frame(height: 40) // Fixed height for the city label
                                Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255)) // Same light gray color for the description
                                    .font(Font.system(size: 16, weight: .medium)) // System font with size 16
                            }
                            
                            // Hero image displayed with a frame and rounded corners
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                    Image("Hero image")
                                        .resizable()
                                        .scaledToFill()
                                )
                                .clipShape(Rectangle()) // Clip image to rectangle shape
                                .cornerRadius(15) // Rounded corners for the image
                                .frame(width: 150, height: 150) // Fixed width and height for the image
                        }
                        .padding([.leading, .trailing]) // Horizontal padding for the subheader
                        .padding(.bottom, 20) // Bottom padding
                    }
                }
                .frame(height: 240) // Fixed height for the intro section
                
                // Form section for user registration input
                VStack(alignment: .leading) {
                    
                    // Navigation link to the Home view after successful registration
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    
                    // TextField for first name input
                    TextField("First Name*", text: $firstName)
                        .padding([.leading, .trailing]) // Horizontal padding
                        .padding([.top, .bottom], 10) // Vertical padding
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1) // Border for the text field
                        )
                        .padding([.leading, .trailing, .top]) // Extra padding around the text field
                    
                    // TextField for last name input
                    TextField("Last Name*", text: $lastName)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                    
                    // TextField for email input, with email-specific keyboard and validation
                    TextField("Email*", text: $email)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                        .keyboardType(.emailAddress) // Email keyboard type
                        .textContentType(.emailAddress) // Suggests email format
                }
                
                // Register button to save user data and navigate
                Button("Register") {
                    // Check if all required fields are filled
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        // Save data to UserDefaults
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn) // Mark as logged in
                        isLoggedIn = true // Update state
                        print("Registration successful")
                    } else {
                        print("Missing data. Show alert to the user.") // Placeholder for error handling
                    }
                }
                .font(Font.system(size: 18, weight: .medium)) // Button text style
                .frame(width: 150) // Fixed width for the button
                .padding([.leading, .trailing]) // Horizontal padding
                .padding([.top, .bottom], 10) // Vertical padding
                .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255)) // Button text color
                .background(Color(red: 73/255, green: 94/255, blue: 87/255)) // Button background color
                .cornerRadius(10) // Rounded corners for the button
                
                Spacer() // Spacer to push content up
            }
            .onAppear {
                // Check if the user is already logged in when the view appears
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

// Preview for the Onboarding view
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

// Extension to dismiss keyboard when tapping outside the text fields
extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

// Gesture recognizer delegate to handle tap gestures outside text fields
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // Allows detecting tap gestures during other gestures
    }
}
