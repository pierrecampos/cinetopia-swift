//
//  HomePresenter.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 13/02/24.
//

import Foundation

protocol HomePresenterToViewControllerProtocol {
    func setViewController(_ controller: HomeViewControllerToPresenterProtocol)
    func viewDidLoad()
}

protocol HomePresenterToViewProtocol {
    func didContinueButtonTapped()
}

class HomePresenter: HomePresenterToViewControllerProtocol {
    //    MARK: - Attributes
    private var controller: HomeViewControllerToPresenterProtocol?
    private var view: HomeViewProtocol?
    
    //    MARK: - Init
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    //    MARK: - HomePresenterToViewControllerProtocol
    func setViewController(_ controller: HomeViewControllerToPresenterProtocol) {
        self.controller = controller
    }
    
    func viewDidLoad() {
        view?.setPresenter(self)
    }
}

extension HomePresenter: HomePresenterToViewProtocol {
    func didContinueButtonTapped() {
        controller?.didTappedContinueButton()
    }
    
    
}
