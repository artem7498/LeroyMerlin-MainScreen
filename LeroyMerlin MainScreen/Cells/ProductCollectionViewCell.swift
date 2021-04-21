//
//  ProductCollectionViewCell.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/20/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    static let reuseId = "ProductCollectionViewCell"
    
    static func nib() -> UINib{
    return UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 4
//        imageView.layer.borderWidth = 1
//        imageView.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureCell(with chat: MSection) {
        titleLabel.text = chat.price
        categoryLabel.text = chat.name
        imageView.image = UIImage(named: chat.image)
    }

}
