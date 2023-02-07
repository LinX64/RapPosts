//
//  ContentView.swift
//  RapPosts
//
//  Created by Mohsen Rezania on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeTab()
                    .tabItem {
                        Label("Posts", systemImage: "list.dash")
                    }
                FavouritesTab()
                    .tabItem {
                        Label("Posts", systemImage: "star")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
