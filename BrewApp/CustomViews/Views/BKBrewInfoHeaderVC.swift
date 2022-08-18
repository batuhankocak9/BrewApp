//
//  BKBrewInfoHeaderVC.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 17.08.2022.
//

import UIKit

class BKBrewInfoHeaderVC: UIViewController {
    
    var brew: [BrewInfo]!
    
    let titleLabel = BKTitleLabel(textAlignment: .center, fontSize: 35)
    let imageView = BKImageView(frame: .zero)
    let taglineLabel = BKTitleLabel(textAlignment: .center, fontSize: 17)
    let firstBrewedLabel = BKFeatureLabel(fontSize: 14)
    let abvLabel = BKFeatureLabel(fontSize: 14)
    let ibuLabel = BKFeatureLabel(fontSize: 14)
    let targetOGLabel = BKFeatureLabel(fontSize: 14)
    let descriptionLabel = BKBodyLabel(fontSize: 17)
    let brewersTip = BKTitleLabel(textAlignment: .center, fontSize: 28)
    let brewAdvice = BKBodyLabel(fontSize: 17)
    let contributedByLabel = BKTitleLabel(textAlignment: .left, fontSize: 25)
    
    init(brew: [BrewInfo]) {
        super.init(nibName: nil, bundle: nil)
        self.brew = brew
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureUIElements()
        layoutUI()
    }
    
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(taglineLabel)
        view.addSubview(firstBrewedLabel)
        view.addSubview(abvLabel)
        view.addSubview(ibuLabel)
        view.addSubview(targetOGLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(brewersTip)
        view.addSubview(brewAdvice)
        view.addSubview(contributedByLabel)
        
    }
    
    func configureUIElements() {
        titleLabel.text = brew[0].name
        imageView.downloadImage(from: brew[0].imageUrl ?? Placeholders.placeholderImageURL)
        taglineLabel.text = brew[0].tagline
        abvLabel.text = "ABV \n \(brew[0].abv)"
        ibuLabel.text = "IBU \n \(brew[0].ibu)"
        targetOGLabel.text = "Target OG \n \(brew[0].targetOg)"
        firstBrewedLabel.text = "First Brewed\n \(brew[0].firstBrewed)"
        descriptionLabel.text = "\(brew[0].description)"
        brewersTip.text = "🍺 Brewer's Tip"
        brewersTip.numberOfLines = 1
        brewAdvice.text = brew[0].brewersTips
        contributedByLabel.text = "Contributed by: \(brew[0].contributedBy)"
        contributedByLabel.numberOfLines = 1
    }
    
    private func layoutUI() {
        view.backgroundColor = Colors.containerViewBackgroundColor
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            taglineLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            taglineLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            taglineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            taglineLabel.heightAnchor.constraint(equalToConstant: 40),
            
            firstBrewedLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 15),
            firstBrewedLabel.centerXAnchor.constraint(equalTo: taglineLabel.centerXAnchor),
            firstBrewedLabel.heightAnchor.constraint(equalToConstant: 50),
            
            abvLabel.topAnchor.constraint(equalTo: firstBrewedLabel.bottomAnchor, constant: 25),
            abvLabel.leadingAnchor.constraint(equalTo: taglineLabel.leadingAnchor),
            abvLabel.widthAnchor.constraint(equalToConstant: 70),
            abvLabel.heightAnchor.constraint(equalToConstant: 80),
            
            targetOGLabel.topAnchor.constraint(equalTo: abvLabel.topAnchor),
            targetOGLabel.leadingAnchor.constraint(equalTo: abvLabel.trailingAnchor, constant: 5),
            targetOGLabel.widthAnchor.constraint(equalToConstant: 70),
            targetOGLabel.heightAnchor.constraint(equalToConstant: 80),
            
            ibuLabel.topAnchor.constraint(equalTo: abvLabel.topAnchor),
            ibuLabel.leadingAnchor.constraint(equalTo: targetOGLabel.trailingAnchor, constant: 5),
            ibuLabel.widthAnchor.constraint(equalToConstant: 70),
            ibuLabel.heightAnchor.constraint(equalToConstant: 80),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150),
            
            brewersTip.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            brewersTip.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            brewersTip.widthAnchor.constraint(equalToConstant: 150),
            brewersTip.heightAnchor.constraint(equalToConstant: 38),
            
            brewAdvice.topAnchor.constraint(equalTo: brewersTip.bottomAnchor, constant: 5),
            brewAdvice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            brewAdvice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            brewAdvice.heightAnchor.constraint(equalToConstant: 100),
            
            contributedByLabel.topAnchor.constraint(equalTo: brewAdvice.bottomAnchor, constant: 5),
            contributedByLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            contributedByLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            contributedByLabel.heightAnchor.constraint(equalToConstant: 38)
            
        ])
    }
    
    
    
}

