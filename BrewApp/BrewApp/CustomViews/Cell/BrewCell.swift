//
//  BrewCell.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 17.08.2022.
//

import UIKit

class BrewCell: UICollectionViewCell {
    static let reuseID = "BrewCell"
    
    let brewImageView = BKImageView(frame: .zero)
    let brewNameLabel = BKTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(brew: Brew) {
        brewNameLabel.text = brew.name
        brewImageView.downloadImage(from: brew.imageUrl ?? Placeholders.placeholderImageURL)
    }
    
    private func configure() {
        addSubview(brewImageView)
        addSubview(brewNameLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            brewImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            brewImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            brewImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            brewImageView.heightAnchor.constraint(equalToConstant: 100),
            
            brewNameLabel.topAnchor.constraint(equalTo: brewImageView.bottomAnchor, constant: 12),
            brewNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            brewNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            brewNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
        ])
    }
}
