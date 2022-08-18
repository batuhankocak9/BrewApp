//
//  BKFeatureLabel.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 16.08.2022.
//

import UIKit

class BKFeatureLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
    private func configure() {
        textColor = Colors.featureLabelTextColor
        backgroundColor = Colors.featureLabelBackgroundColor
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.6
        numberOfLines = 2
        lineBreakMode = .byTruncatingTail
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        
    }
    
}
