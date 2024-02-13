//
//  MovieDetailsView.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 13/02/24.
//

import UIKit
import Kingfisher

protocol MovieDetailsViewProtocol: AnyObject {
    func setupPresenter(_ presenter: MovieDetailsPresenterToViewProtocol)
    func setupView(with movie: Movie)
}

class MovieDetailsView: UIView {
    
    //    MARK: - Attributes
    private var presenter: MovieDetailsPresenterToViewProtocol?
    
    //    MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - UI Components
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 32
        return imageView
    }()
    
    private lazy var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var movieSynopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView =  {
        let stackView = UIStackView(arrangedSubviews: [movieTitleLabel, moviePosterImageView, movieRatingLabel, movieSynopsisLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    //    MARK: - Class Methods
    private func addSubviews() {
        scrollView.addSubview(stackView)
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -64),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 350),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}

extension MovieDetailsView: MovieDetailsViewProtocol {
    func setupPresenter(_ presenter: MovieDetailsPresenterToViewProtocol) {
        self.presenter = presenter
    }
    
    func setupView(with movie: Movie) {
        moviePosterImageView.setImageFrom(for: movie.image)
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "Classificação dos usuários: \(String(describing: movie.rate))"
        movieSynopsisLabel.text = movie.synopsis
    }
    
    
}
