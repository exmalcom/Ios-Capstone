//
//  Menu.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

// Menu view displaying the restaurant's menu items
struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = "" // State to store the search text input
    
    var body: some View {
        VStack {
            // Header: Contains the logo and profile image
            HStack {
                Spacer()
                Image("Logo")
                    .padding(.leading)
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.leading, .trailing])
            
            // Hero section: Displays the restaurant name and description
            Group {
                ZStack {
                    Rectangle().foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255)) // Background color
                    VStack {
                        // Restaurant name and location
                        HStack {
                            Text("Little Lemon")
                                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                                .font(Font.custom("Georgia", size: 40))
                                .bold()
                                .padding([.leading], 20)
                            Spacer()
                        }
                        .frame(height: 45)
                        
                        // Restaurant description and search bar
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Chicago")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .font(Font.custom("Georgia", size: 30))
                                    .fontWeight(.medium)
                                    .frame(height: 40)
                                Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .font(Font.system(size: 16, weight: .medium))
                                
                                // Search bar for searching menu items
                                HStack {
                                    Image(systemName: "magnifyingglass.circle.fill")
                                        .resizable()
                                        .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                                        .frame(width: 40, height: 40)
                                    
                                    TextField(" Search...", text: $searchText)
                                        .padding(10)
                                        .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                        .frame(width: 120)
                                        .cornerRadius(20)
                                        .padding(.leading, 5)
                                }
                                .padding(.top, 10)
                            }
                        }
                        Rectangle()
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                Image("Hero image")
                                    .resizable()
                                    .scaledToFill()
                            )
                            .clipShape(Rectangle())
                            .cornerRadius(15)
                            .frame(width: 150, height: 150)
                    }
                    .padding([.leading, .trailing])
                    .padding(.bottom, 20)
                }
            }
            .frame(height: 300)
            
            // Menu Breakdown: Contains categories like starters, mains, desserts, and drinks
            Group {
                VStack(alignment: .leading) {
                    Text("ORDER FOR DELIVERY!")
                        .font(Font.system(size: 18, weight: .bold))
                    
                    // Category buttons (Starters, Mains, Desserts, Drinks)
                    HStack {
                        Button("Starters") {
                            // code here
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Mains") {
                            // code here
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Desserts") {
                            // code here
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Drinks") {
                            // code here
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                        .cornerRadius(13)
                    }
                    Divider()
                        .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .padding(.top, 10)
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 10)
            }
            
            // Menu Items: Displays the list of menu items fetched from Core Data
            Group {
                NavigationView {
                    FetchedObjects(predicate: buildPredicates(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                        ScrollView {
                            ForEach(dishes, id: \.self) { dish in
                                NavigationLink(destination: {
                                    Details(title: dish.title ?? "",
                                            price: dish.price ?? "",
                                            image: dish.image ?? "",
                                            description: dish.dishDescription ?? "")
                                }) {
                                    VStack {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(dish.title ?? "")
                                                    .font(Font.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                Text(dish.dishDescription ?? "")
                                                    .font(Font.system(size: 16, weight: .regular))
                                                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                    .frame(width: 280, alignment: .leading)
                                                Text("$\(dish.price ?? "")")
                                                    .font(Font.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                            }
                                            AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                                                switch phase {
                                                case .empty:
                                                    Image(systemName: "exclamationmark.icloud")
                                                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                case .success(let image):
                                                    image.resizable()
                                                        .scaledToFit()
                                                case .failure(_):
                                                    Image(systemName: "exclamationmark.icloud")
                                                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                @unknown default:
                                                    Image(systemName: "exclamationmark.icloud")
                                                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                }
                                            }
                                            .frame(width: 70, height: 70)
                                        }
                                        Divider()
                                            .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                                            .padding(.top, 5)
                                    }
                                    .padding([.leading, .trailing], 20)
                                }
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
            }
        }
        .task {
            await getMenuData() // Fetch menu data when the view appears
        }
    }
    
    // Function to fetch the menu data from the API
    func getMenuData() async {
        PersistenceController.shared.clear() // Clear existing data before fetching new
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let menuList = try decoder.decode(MenuList.self, from: data)
            // Save fetched data to Core Data
            for menuItem in menuList.menu {
               
