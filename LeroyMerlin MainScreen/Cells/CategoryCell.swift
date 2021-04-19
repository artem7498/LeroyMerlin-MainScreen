//
//  CategoryCell.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/19/21.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    static var reuseId: String = "WaitingChatCell"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)

        imageView.frame = self.bounds
        addSubview(imageView)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func configureCell(with chat: MSection) {
        imageView.image = UIImage(named: chat.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
