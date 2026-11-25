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
    
    private let viewModel: LibraryViewModel
    
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
    )
    
    // dışarıdan bir viewmodel verilmesi zorunlu tutmak için
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print(viewModel.books.count)
    }
    //dinamik yönetmek için hesaplanmış boyutları hesapladık
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let spacing = layout.minimumInteritemSpacing
        let availableWidth = collectionView.bounds.width - spacing
        let itemWidth = floor(availableWidth / 2)

        layout.itemSize = CGSize(
                width: itemWidth,
                height: 260
                )
    }
    
    private func setupUI(){
        
        view.backgroundColor = AppColors.background
        
        setupLabels()
        setupBookMark()
        setupStackViews()
        setupSearchButton()
        setupCollectionView()
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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
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
            ),
            collectionView.topAnchor.constraint(
                equalTo: headerStackView.bottomAnchor,
                constant: 24
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupCollectionView(){
        setupLayout()
        collectionView.backgroundColor = .clear
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 24
    }
    
    @objc private func searchButtonTapped(){
        onSearchTapped?()
    }
   
}



extension LibraryViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        //kaç hücre göstermeliyim
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.books.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as! BookCollectionViewCell

        let book = viewModel.books[indexPath.item]
// kitap bilgileri hücreye aktarılıyor
        cell.configure(book: book)

        return cell
    }
}
extension LibraryViewController: UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let book = viewModel.books[indexPath.item]

        print(book.title)
    }
}
