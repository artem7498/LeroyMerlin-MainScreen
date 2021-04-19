//
//  ProductCell.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/18/21.
//

import UIKit

class ProductCell: UICollectionViewCell {

    static let reuseId = "video-cell-reuse-identifier"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let categoryLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configureCell(with chat: MSection) {
        titleLabel.text = chat.price
        categoryLabel.text = chat.name
        imageView.image = UIImage(named: chat.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ProductCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)

        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        categoryLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.textColor = .placeholderText

//        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 0
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = UIColor.white

        let spacing = CGFloat(10)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: self.bounds.width),
            imageView.heightAnchor.constraint(equalToConstant: self.bounds.width * 1.1),
//            необходимо доработать для авто сайзинга imageView
            

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}

