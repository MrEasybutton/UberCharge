//
//  ContentView.swift
//  UberCharge
//
//  Created by Tyler Kiong on 19/9/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        TabView {
            AccountMenu()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Account")
                }
                .tint(.red)
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .accentColor(Color(.systemPurple))
                .onAppear {
                    viewModel.checklocservbool()
                }
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("UberMap")

                }
                .tint(.purple)
            YourRide()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Payment")
                }
            
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemTeal
            UITabBar.appearance().isTranslucent = true
        }
        .tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}


