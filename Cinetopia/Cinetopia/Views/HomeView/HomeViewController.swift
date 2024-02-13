//
//  ViewController.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 24/01/24.
//

import UIKit

protocol HomeViewControllerToPresenterProtocol: AnyObject {
    func didTappedContinueButton()
}

class HomeViewController: UIViewController {
    
    // MARK: - Attributes
    private var presenter: HomePresenterToViewControllerProtocol?
    private var mainView: HomeView?
    
    //    MARK: - Init
    init(mainView: HomeView, presenter: HomePresenterToViewControllerProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.mainView = mainView
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setViewController(self)
        presenter?.viewDidLoad()
    }
}

extension HomeViewController: HomeViewControllerToPresenterProtocol {
    func didTappedContinueButton() {
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
    
}

