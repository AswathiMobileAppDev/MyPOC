//
//  NetworkManager.swift
//  MyPOC
//
//  Created by B, Aswathi on 22/09/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func makeRequest(request: URLRequest, handler: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            } else if let data = data, let urlResponse = response {
                DispatchQueue.main.async {
                    handler(.success((data, urlResponse)))
                }
            }
        }.resume()
    }
}
