//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 26/01/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: movie.image))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 32
        return imageView
    }()
    
    private lazy var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var movieSynopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView =  {
        let stackView = UIStackView(arrangedSubviews: [movieTitleLabel, moviePosterImageView, movieRatingLabel, movieSynopsisLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            moviePosterImageView.heightAnchor.constraint(equalToConstant: 350),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
}
