//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 09/02/24.
//

import Foundation

class MovieManager {
    // MARK: - Attributes
    static let shared = MovieManager()
    var favoritesMovies: [Movie] = []
    
    // MARK: - Init
    private init(){}
    
    // MARK: Class Methods
    func add(_ movie: Movie) {
        if favoritesMovies.contains(where: { $0.id == movie.id}) { return }
        favoritesMovies.append(movie)
    }
    
    func remove(_ movie: Movie) {
        if let index = favoritesMovies.firstIndex(where: { $0.id == movie.id }) {
            favoritesMovies.remove(at: index)
        }
    }
}
