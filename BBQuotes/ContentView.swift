//
//  ContentView.swift
//  BBQuotes
//
//  Created by Ruben Movsisyan on 3/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Breaking Bad View")
                .tabItem {
                    Label("Breaking bad", systemImage: "tortoise" )
                }
            Text("Better Call Saul View")
                .tabItem {
                    Label("Better Call Saul View", systemImage: "briefcase" )
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
