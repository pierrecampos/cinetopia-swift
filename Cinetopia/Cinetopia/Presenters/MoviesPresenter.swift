//
//  MoviesPresenter.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 12/02/24.
//

import UIKit

protocol MoviesPresenterToViewControllerProtocol: AnyObject {
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol)
    func viewDidLoad()
    func viewDidAppear()
}

protocol MoviesPresenterToViewProtocol: AnyObject {
    func didSelect(_ movie: Movie)
    func didSelectFavoriteButton(_ movie: Movie)
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie])
}


class MoviesPresenter: MoviesPresenterToViewControllerProtocol {
    // MARK: - Attributes
    private var controller: MoviesViewControllerToPresenterProtocol?
    private var view: MoviesViewProtocol?
    private var movieService: MovieService = MovieService()
    
    // MARK: - Init
    init(view: MoviesViewProtocol) {
        self.view = view
    }
    
    // MARK: - MoviesViewControllerToPresenterProtocol
    
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol) {
        self.controller = viewController
    }
    
    // MARK: - MoviesPresenterToViewControllerProtocol
    
    func viewDidLoad() {
        view?.setPresenter(self)
        Task {
            await fetchMovies()
        }
    }
    
    func viewDidAppear() {
        view?.reloadData()
    }
    
    // MARK: - Class Methods
    private func fetchMovies() async {
        do {
            let movies = try await movieService.getMovies()
            view?.setupView(with: movies)
            view?.reloadData()
        } catch (let error) {
            print(error)
        }
    }
}

extension MoviesPresenter: MoviesPresenterToViewProtocol {
    func didSelect(_ movie: Movie) {
        controller?.didSelectMovie(movie)
        
    }
    
    func didSelectFavoriteButton(_ movie: Movie) {
        movie.changeSelectionStatus()
        MovieManager.shared.add(movie)
    }
    
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie]) {
        if searchText.isEmpty {
            view?.toggle(false)
        } else {
            filteredMovies = movies.filter { movie in
                movie.title.lowercased().contains(searchText.lowercased())
            }
            view?.toggle(true)
        }
    }
    
}

