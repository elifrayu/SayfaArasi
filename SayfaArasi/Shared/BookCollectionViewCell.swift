//
//  BookCollectionViewCell.swift
//  SayfaArasi
//
//  Created by elif uyar on 25.11.2026.
//

import UIKit

final class BookCollectionViewCell: UICollectionViewCell {
    
    private let coverImageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let stackView = UIStackView()
    
    static let reuseIdentifier = "BookCollectionViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
        
        print("Yeni hücre oluşturuldu")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupCoverImageView()
        setupLabels()
        setupStackView()
        setupConstraints()
    }
    
    private func setupCoverImageView() {
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.backgroundColor = .tertiarySystemFill
        coverImageView.layer.cornerRadius = 8
        //dışarı çıkan alanları gösterilmeisni engeller
        coverImageView.clipsToBounds = true
        coverImageView.image = UIImage(systemName: "book.closed")
        coverImageView.tintColor = .secondaryLabel
    }
    
    private func setupLabels() {
        titleLabel.font = AppTypography.body
        titleLabel.textColor = AppColors.primaryText
        titleLabel.numberOfLines = 2

        authorLabel.font = AppTypography.caption
        authorLabel.textColor = .secondaryLabel
        authorLabel.numberOfLines = 1
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill

        stackView.addArrangedSubview(coverImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)

        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),

            stackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),

            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),

            stackView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor
            ),

            coverImageView.heightAnchor.constraint(
                equalToConstant: 180
            )
        ])
    }
    
    func configure(book: Book) {
        titleLabel.text = book.title

        authorLabel.text = book.authors.isEmpty
            ? "Anonim"
            : book.authors.joined(separator: ", ")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        authorLabel.text = nil
        coverImageView.image = UIImage(systemName: "book.closed")
    }
}

