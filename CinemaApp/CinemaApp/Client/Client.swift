//
//  Client.swift
//  CinemaApp
//
//  Created by Diana Pava Avila on 15/07/23.
//

import Foundation

class Client{
    func request<T: Codable>(url: String, headers: [String: String] = [:] ,onSuccess: @escaping (T) -> Void, onFailure: @escaping (Error) -> Void){
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                onFailure(error)
            }
            
            guard let data = data else{
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                onSuccess(model)
            } catch {
                onFailure(error)
            }
        }.resume()
    }
}
