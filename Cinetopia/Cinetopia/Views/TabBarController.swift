//
//  TabBarController.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 09/02/24.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func setupTabBarController() {
        let view = MoviesView()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(view: view, interactor: interactor)
        let home = UINavigationController(rootViewController: MoviesViewController(view: view, presenter: presenter))
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes populares"
        
        let favorite = UINavigationController(rootViewController: FavoriteMoviesViewController())
        let heartSymbol = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        favorite.tabBarItem.image = heartSymbol
        favorite.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home, favorite], animated: true)
    }

}
