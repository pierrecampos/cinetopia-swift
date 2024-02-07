//
//  MovieService.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 29/01/24.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct MovieService {
    func getMovies() async throws -> [Movie] {
        let urlString = "https://run.mocky.io/v3/232ef32d-7858-4eed-ae68-1a44e2eee6b2"
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch (let error) {
            print(error)
            throw MovieServiceError.decodingError
        }
        
    }
}
