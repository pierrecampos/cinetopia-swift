//
//  MoviesInteractor.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 13/02/24.
//

import Foundation

protocol MoviesInteractorToPresenterProtocol {
    func getMovies() async throws -> [Movie]
}

class MoviesInteractor: MoviesInteractorToPresenterProtocol {
    private var movieService: MovieService = MovieService()
    
    func getMovies() async throws -> [Movie] {
        do {
            let movies = try await movieService.getMovies()
            return movies
        } catch (let error) {
           throw error
        }
    }
    
    
}
