//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 02/02/24.
//

import UIKit

protocol FavoriteMoviesViewControllerToPresenterProtocol: AnyObject {}

class FavoriteMoviesViewController: UIViewController {
    
    // MARK: - Attributes
    private var mainView: FavoriteMoviesView?
    private var presenter: FavoriteMoviesPresenterToViewControllerProtocol?
    
    // MARK: - Init
    init(mainView: FavoriteMoviesView, presenter: FavoriteMoviesPresenterToViewControllerProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.mainView = mainView
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        presenter?.setViewController(self)
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView?.reloadData()
    }
    
}

extension FavoriteMoviesViewController: FavoriteMoviesViewControllerToPresenterProtocol {}

