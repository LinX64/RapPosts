import SwiftUI

struct Post: Codable, Identifiable {
    var id = Int()
    var title: String
    var body: String
}

class Api {
    func getPosts(onCompletion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let posts = try! JSONDecoder().decode([Post].self, from: data!)
                
                DispatchQueue.main.async {
                    onCompletion(posts)
                }
            }
            .resume()
    }
}
