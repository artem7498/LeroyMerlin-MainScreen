//
//  SectionHeader.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/19/21.
//

import UIKit

class SectionHeader: UICollectionReusableView{
    
    static let reuseId = "SectionHeader"
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customizeElements()
        setupConstraints()
    }
    
    func customizeElements(){
        title.textColor = .black
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        title.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
