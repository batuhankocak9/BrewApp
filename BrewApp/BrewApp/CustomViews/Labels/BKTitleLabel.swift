//
//  BKTitleLabel.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 15.08.2022.
//

import UIKit

class BKTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textColor = Colors.titleLabelColor
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.6
        numberOfLines = 2
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
