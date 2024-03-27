//
//  FetchController.swift
//  BBQuotes
//
//  Created by Ruben Movsisyan on 3/26/24.
//

import Foundation

struct FetchController {
    enum NetworkError: Error {
        case badUrl, badResponse
    }
    
    private let baseUrl = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQuote(from show: String) async throws -> Quote {
        let quoteUrl = baseUrl.appending(path: "quotes/random")
        var quoteComponetns = URLComponents(url: quoteUrl, resolvingAgainstBaseURL: true)
        let quoteQueryItem = URLQueryItem(name: "production", value: show.replaceSpaceWithPlus)
        quoteComponetns?.queryItems = [quoteQueryItem]
        
        guard let fetchUrl = quoteComponetns?.url else { throw NetworkError.badUrl }
        
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        return quote
    }
    
    func fetchCharacter(_ name: String) async throws -> Character {
        let characterURL = baseUrl.appending(path: "characters")
        var characterComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        let characterQueryItem = URLQueryItem(name: "name", value: name.replaceSpaceWithPlus)
        characterComponents?.queryItems = [characterQueryItem]
        
        guard let fetchURL = characterComponents?.url else { throw NetworkError.badUrl }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let decoder =  JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Character].self, from: data)
        
        return characters[0]
    }
}
