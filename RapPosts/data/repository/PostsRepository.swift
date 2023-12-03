import SwiftUI

class Api {
    func getNews(onCompletion: @escaping (NewsResponse) -> Void) {
        let business_headlines = "top-headlines?country=us&category=business&apiKey=\(Consts.apiKey)"
        guard let url = URL(string: "https://newsapi.org/v2/\(business_headlines)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                let newsResp = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    onCompletion(newsResp)
                }
            } catch let decodingError {
                print(decodingError)
            }
        }
        .resume()
    }
    
}
