//
//  ContentView.swift
//  HomeDesign001
//
//  Created by 米国梁 on 2021/5/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab = "home"
    
    init() {
        
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
            Home()
                .tabItem {
                    Image("tab-home\(activeTab == "home" ? "-active" : "")")
                    Text("Home")
                }
                .tag("home")
            
            Text("b")
                .tabItem {
                    Image("tab-truck\(activeTab == "truck" ? "-active" : "")")
                    Text("Truck")
                }
                .tag("truck")
            
            Text("c")
                .tabItem {
                    Image("tab-location\(activeTab == "location" ? "-active" : "")")
                    Text("Location")
                }
                .tag("location")
            
            Text("d")
                .tabItem {
                    Image("tab-calendar\(activeTab == "calendar" ? "-active" : "")")
                    Text("Calendar")
                }
                .tag("calendar")
            
            Text("me")
                .tabItem {
                    Image("tab-me\(activeTab == "me" ? "-active" : "")")
                    Text("Me")
                }
                .tag("me")
        }
        .accentColor(Color(red: 0x12/255, green: 0x96/255, blue: 0xdb/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
