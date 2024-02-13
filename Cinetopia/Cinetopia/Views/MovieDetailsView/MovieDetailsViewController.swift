//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 26/01/24.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    //    MARK: - Attributes
    private var presenter: MovieDetailsPresenterToViewControlerProtocol?
    private var mainView: MovieDetailsView?
    
    //    MARK: - Init
    init(presenter: MovieDetailsPresenterToViewControlerProtocol, mainView: MovieDetailsView) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.mainView = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - View Life Cycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    
    
}
