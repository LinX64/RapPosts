import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeTab()
                    .tabItem {
                        Label("Home", systemImage: "list.dash")
                    }
                FavouritesTab()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // action here
                    }) {
                        Image(systemName: "person.circle")
                            .frame(width: 32, height: 32)
                            .mask(Circle())
                        
                        Text("Welcome, Mohsen!")
                    }
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
