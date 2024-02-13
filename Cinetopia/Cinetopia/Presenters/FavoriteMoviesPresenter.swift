//
//  FavoriteMoviesPresenter.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 13/02/24.
//

import Foundation

protocol FavoriteMoviesPresenterToViewControllerProtocol: AnyObject {
    func setViewController(_ controller: FavoriteMoviesViewControllerToPresenterProtocol)
    func viewDidLoad()
    func viewDidAppear()
}

protocol FavoriteMoviesPresenterToViewProtocol: AnyObject {
    func didSelectFavoriteButton(_ movie: Movie)
}


class FavoriteMoviesPresenter: FavoriteMoviesPresenterToViewControllerProtocol {
    // MARK: - Attributes
    private var view: FavoriteMoviesViewProtocol?
    private var controller: FavoriteMoviesViewControllerToPresenterProtocol?
    
    // MARK: - Init
    init(view: FavoriteMoviesViewProtocol) {
        self.view = view
    }
    
    // MARK: - FavoriteMoviesPresenterToViewControllerProtocol
    func setViewController(_ controller: FavoriteMoviesViewControllerToPresenterProtocol) {
        self.controller = controller
    }
    
    func viewDidLoad() {
        view?.setPresenter(self)
    }
    
    func viewDidAppear() {
        view?.reloadData()
    }
    
}

extension FavoriteMoviesPresenter: FavoriteMoviesPresenterToViewProtocol {
    func didSelectFavoriteButton(_ movie: Movie) {
        movie.changeSelectionStatus()
        MovieManager.shared.remove(movie)
    }
}
