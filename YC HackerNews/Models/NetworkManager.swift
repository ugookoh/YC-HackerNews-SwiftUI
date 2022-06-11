//
//  NetworkManager.swift
//  YC HackerNews
//
//  Created by Ugo Okoh on 2022-06-10.
//

import Foundation

class NetworkManager: ObservableObject {
  @Published var posts: [Post] = []
  func fetchData() {
    if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: url) { data, reponse, error in
        if error == nil {
          let decoder = JSONDecoder()
          if let safeData = data {
            do {
              let results = try decoder.decode(ResultJSONStruct.self, from: safeData)
              DispatchQueue.main.async {
                self.posts = results.hits
              }
            } catch let e {
              print("An error occured when decoding news")
              print(e.localizedDescription)
            }
          }
        }
      }
      task.resume()
    }
  }
}
