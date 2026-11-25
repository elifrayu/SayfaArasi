//
//  ProfileViewController.swift
//  SayfaArasi
//
//  Created by elif uyar on 24.11.2026.
//

import UIKit

final class ProfileViewController : UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let headerStackView = UIStackView()
    
    private let favoritesCardView = UIView()
    private let favoritesTitleLabel = UILabel()
    private let favoritesCountLabel = UILabel()
    private let favoritesChevronImageView = UIImageView()
    private let favoritesStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupScrollView()
        setupStackView()
        setupHeader()
        
        setupFavoritesLabels()
        setupFavoritesStackView()
        setupFavoritesCard()
        
        setupConstraints()
    }
    private func setupUI(){
        view.backgroundColor = AppColors.background
        title = "Profil"
    }
    
    private func setupScrollView(){
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
    }
    private func setupStackView(){
        contentStackView.axis = .vertical
        contentStackView.spacing = 24
        contentStackView.alignment = .fill
        contentStackView.distribution = .fill
        // scroll viewın içerisine ekledim
        scrollView.addSubview(contentStackView)
    }
    
    private func setupConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        favoritesStackView.translatesAutoresizingMaskIntoConstraints = false
        favoritesChevronImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor
                ),
                scrollView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor
                ),
                scrollView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor
                ),
                scrollView.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor
                ),
                contentStackView.topAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.topAnchor,
                    constant: 24
                ),
                contentStackView.leadingAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                    constant: 24
                ),
                contentStackView.trailingAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                    constant: -24
                ),
                contentStackView.bottomAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                    constant: -24
                ),
                contentStackView.widthAnchor.constraint(
                    equalTo: scrollView.frameLayoutGuide.widthAnchor,
                    constant: -48
                ),
                favoritesCardView.heightAnchor.constraint(equalToConstant: 200),
                
                favoritesStackView.topAnchor.constraint(
                    equalTo: favoritesCardView.topAnchor, constant: 24
                ),
                favoritesStackView.leadingAnchor.constraint(
                    equalTo: favoritesCardView.leadingAnchor, constant: 24
                ),
                favoritesChevronImageView.trailingAnchor.constraint(
                    equalTo: favoritesCardView.trailingAnchor, constant: -24
                ),
                favoritesChevronImageView.centerYAnchor.constraint(
                    equalTo: favoritesStackView.centerYAnchor
                ),
                favoritesChevronImageView.widthAnchor.constraint(equalToConstant: 16),
                favoritesChevronImageView.heightAnchor.constraint(equalToConstant: 20),

                favoritesStackView.trailingAnchor.constraint(
                    lessThanOrEqualTo: favoritesChevronImageView.leadingAnchor,
                    constant: -12
                )
            ])
    }
    private func setupHeader() {
        titleLabel.text = "Profil"
        titleLabel.font = AppTypography.largeTitle
        titleLabel.textColor = AppColors.primaryText

        subtitleLabel.text = "senin tercihlerin..."
        subtitleLabel.font = AppTypography.body
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.numberOfLines = 0

        headerStackView.axis = .vertical
        headerStackView.spacing = 8
        headerStackView.alignment = .leading

        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(subtitleLabel)

        contentStackView.addArrangedSubview(headerStackView)
    }
    
    private func setupFavoritesCard() {
        favoritesCardView.backgroundColor = UIColor(
            red: 0.21,
            green: 0.35,
            blue: 0.29,
            alpha: 1.0
        )

        favoritesCardView.layer.cornerRadius = 20

        contentStackView.addArrangedSubview(favoritesCardView)
    }
    private func setupFavoritesLabels() {
        favoritesTitleLabel.text = "Favorilerim"
        favoritesTitleLabel.font = AppTypography.title
        favoritesTitleLabel.textColor = .white

        favoritesCountLabel.text = "0 kitap"
        favoritesCountLabel.font = AppTypography.body
        favoritesCountLabel.textColor = .white

        favoritesChevronImageView.image = UIImage(systemName: "chevron.right")
        favoritesChevronImageView.tintColor = .white
        favoritesChevronImageView.contentMode = .scaleAspectFit
    }
    private func setupFavoritesStackView() {
        favoritesStackView.axis = .vertical
        favoritesStackView.spacing = 8
        favoritesStackView.alignment = .leading

        favoritesStackView.addArrangedSubview(favoritesTitleLabel)
        favoritesStackView.addArrangedSubview(favoritesCountLabel)

        favoritesCardView.addSubview(favoritesStackView)
        favoritesCardView.addSubview(favoritesChevronImageView)
    }
    
}
