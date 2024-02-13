//
//  MovieDetailsPresenter.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 13/02/24.
//

import Foundation

protocol MovieDetailsPresenterToViewControlerProtocol: AnyObject {
    func viewDidLoad()
}

protocol MovieDetailsPresenterToViewProtocol: AnyObject {
}

class MovieDetailsPresenter: MovieDetailsPresenterToViewControlerProtocol {
    //    MARK: - Attributes
    private var movie: Movie
    private var view: MovieDetailsView?
    
    //    MARK: - Init
    init(movie: Movie, view: MovieDetailsView) {
        self.movie = movie
        self.view = view
    }
    
    //    MARK: - MovieDetailsPresenterToViewControlerProtocol
    func viewDidLoad() {
        view?.setupView(with: movie)
    }
    
    
}
