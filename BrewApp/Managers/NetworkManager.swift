//
//  NetworkManager.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 15.08.2022.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    
    init() {}
    
    func getRandomBrew(completed: @escaping (Result<[RandomBrew], BKError>) -> Void) {
        let endpoint = "https://api.punkapi.com/v2/beers/random"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let randomBrew = try decoder.decode([RandomBrew].self, from: data)
                completed(.success(randomBrew))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getBrews(page: Int, completed: @escaping (Result<[Brew], BKError>) -> Void) {
        let endpoint = "https://api.punkapi.com/v2/beers?page=\(page)&per_page=50"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let brew = try decoder.decode([Brew].self, from: data)
                completed(.success(brew))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getBrewInfo(forID id: Int, completed: @escaping (Result<[BrewInfo], BKError>) -> Void) {
        let endpoint = "https://api.punkapi.com/v2/beers/\(id)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let brew = try decoder.decode([BrewInfo].self, from: data)
                completed(.success(brew))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
