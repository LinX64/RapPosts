import SwiftUI

struct HomeTab: View {
    @State var posts: [Post] = []
    
    var body: some View {
            List(posts) { post in
                Text(post.title)
                    .font(Font.headline.weight(.bold))
                
                Text(post.body)
                    .padding()
            }
            .onAppear() {
                Api().getPosts { (posts) in
                    self.posts = posts
                }
            }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
