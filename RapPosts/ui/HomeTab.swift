import SwiftUI

struct HomeTab: View {
    @State private var response: NewsResponse?
    
    var body: some View {
        
        // This is the list of articles with image, title, and description
        List(response?.articles ?? [], id: \.title) { article in
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo")
                default:
                    EmptyView()
                }
            }.listRowSeparator(.hidden, edges: [.bottom])
            
            Text(article.title)
                .font(Font.headline.weight(.bold))
                .listRowSeparator(.hidden, edges: [.bottom])
            
            Text(article.description ?? "")
        }
        .onAppear() {
            Api().getNews { resp in
                self.response = resp
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
