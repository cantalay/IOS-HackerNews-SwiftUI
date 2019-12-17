//
//  NetworkManager.swift
//  HackerNews-SwiftUI
//
//  Created by Can Talay on 17.12.2019.
//  Copyright © 2019 Can Talay. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                }else {
                    let decoder = JSONDecoder()
                    if let optionalData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: optionalData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        }
                        catch{
                            print(error)
                        }
                        
                    }
                    
                }
                
            }
            task.resume()
        }
    }
}
