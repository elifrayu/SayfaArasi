//
//  LibraryViewController.swift
//  SayfaArasi
//
//  Created by elif uyar on 24.11.2026.
//

import UIKit

final class LibraryViewController: UIViewController {
    
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let headerStackView = UIStackView()
    private let bookmarkImageView = UIImageView()
    private let titleStackView = UIStackView()
    private let searchButton = UIButton(type: .system)
    
    var onSearchTapped: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
        view.backgroundColor = AppColors.background
        title = "Kütüphane"
        
        setupLabels()
        setupBookMark()
        setupStackViews()
        setupSearchButton()
        setupConstraints()
    
    }
    private func setupLabels(){
        titleLabel.text = "Sayfa Arası"
        titleLabel.font = AppTypography.largeTitle
        titleLabel.textColor = AppColors.primaryText
        
        subtitleLabel.text = "hangi sayfadasın ?"
        subtitleLabel.font = AppTypography.body
        subtitleLabel.textColor = .secondaryLabel
    }
    private func setupBookMark(){
        bookmarkImageView.image = UIImage(systemName: "bookmark.fill")
        bookmarkImageView.tintColor = AppColors.primaryText
        bookmarkImageView.contentMode = .scaleAspectFit
    }
    private func setupStackViews(){
        titleStackView.axis = .horizontal
        titleStackView.spacing = 8
        titleStackView.alignment = .center

        titleStackView.addArrangedSubview(bookmarkImageView)
        titleStackView.addArrangedSubview(titleLabel)

        headerStackView.axis = .vertical
        headerStackView.spacing = 8
        headerStackView.alignment = .leading

        headerStackView.addArrangedSubview(titleStackView)
        headerStackView.addArrangedSubview(subtitleLabel)

        view.addSubview(headerStackView)
    }
    private func setupSearchButton(){
        searchButton.setImage(
            UIImage(systemName: "magnifyingglass"),
            for: .normal
        )
        searchButton.tintColor = AppColors.primaryText
        searchButton.backgroundColor = .tertiarySystemFill
        searchButton.layer.cornerRadius = 24

        view.addSubview(searchButton)
        
        searchButton.addTarget(
            self,
            action: #selector(searchButtonTapped),
            for: .touchUpInside
        )
    }
    private func setupConstraints(){
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            headerStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),

            headerStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            
            bookmarkImageView.widthAnchor.constraint(equalToConstant: 24),
            bookmarkImageView.heightAnchor.constraint(equalToConstant: 28),
            
            searchButton.widthAnchor.constraint(
                equalToConstant: 48
            ),

            searchButton.heightAnchor.constraint(
                equalToConstant: 48
            ),

            searchButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),

            searchButton.centerYAnchor.constraint(
                equalTo: headerStackView.centerYAnchor
            ),

            headerStackView.trailingAnchor.constraint(
                lessThanOrEqualTo: searchButton.leadingAnchor,
                constant: -12
            )
        ])
    }
    @objc private func searchButtonTapped(){
        onSearchTapped?()
    }
}

