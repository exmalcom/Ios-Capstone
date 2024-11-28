//
//  UserProfile.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

struct UserProfile: View {
    // User information fetched from UserDefaults
    let firstName = UserDefaults.standard.string(forKey: "first name key")
    let lastName = UserDefaults.standard.string(forKey: "last name key")
    let email = UserDefaults.standard.string(forKey: "email key")
    
    // Environment variable to dismiss the current view
    @Environment(\.presentationMode) var presentation
    
    // State variables for notification preferences
    @State var checkedOrderStatus = true
    @State var checkedPasswordChanges = true
    @State var checkedSpetialOffers = true
    @State var checkedNewsletters = true
    
    var body: some View {
        VStack {
            // Header: Contains back button, logo, and profile image
            HStack {
                Button {
                    // Need to dismiss current view
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .frame(width: 35, height: 35)
                }
                Spacer()
                Image("Logo")
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.leading, .trailing])
            
            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        // Personal Info Section
                        Group {
                            Text("Personal Information")
                                .font(Font.system(size: 18, weight: .bold))
                                .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                                .padding([.leading, .trailing], 20)
                                .padding(.top, 12)
                                .padding(.bottom, 5)
                                .bold()
                            
                            // Avatar
                            Text("Avatar")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            HStack {
                                // Profile image and action buttons
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                
                                Button("Change") {
                                    // "Change Info" code here
                                }
                                .font(Font.system(size: 16, weight: .medium))
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 10)
                                .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .cornerRadius(7)
                                .padding(10)
                                
                                Button("Remove") {
                                    // "Remove Profile" code here
                                }
                                .font(Font.system(size: 16, weight: .medium))
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 10)
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .border(Color(red: 73/255, green: 94/255, blue: 87/255))
                                
                                Spacer()
                            }
                            .padding(.leading)
                        }
                        
                        // Texts: Display first name, last name, email, and phone number
                        Group {
                            // Display First Name
                            Text("First name")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text(firstName ?? "")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                            // Display Last Name
                            Text("Last name")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text(lastName ?? "")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                            // Display Email
                            Text("Email")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text(email ?? "")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                            // Display Phone Number
                            Text("Phone number")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text("(217) 555-0113")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                        }
                        
                        // Notifications: Email preferences section
                        Group {
                            Text("Email notifications")
                                .font(Font.system(size: 18, weight: .bold))
                                .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                                .padding([.leading, .trailing], 20)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                                .bold()
                            
                            // Order Status Notification
                            HStack {
                                Image(systemName: checkedOrderStatus ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedOrderStatus ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedOrderStatus.toggle()
                                    }
                                Text("Order statuses")
                                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            
                            // Password Changes Notification
                            HStack {
                                Image(systemName: checkedPasswordChanges ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedPasswordChanges ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedPasswordChanges.toggle()
                                    }
                                Text("Password changes")
                                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            
                            // Special Offers Notification
                            HStack {
                                Image(systemName: checkedSpetialOffers ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedSpetialOffers ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedSpetialOffers.toggle()
                                    }
                                Text("Special offers")
                                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            
                            // Newsletter Notification
                            HStack {
                                Image(systemName: checkedNewsletters ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedNewsletters ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedNewsletters.toggle()
                                    }
                                Text("Newsletter")
                                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding
