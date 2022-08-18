//
//  BKContainerVC.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 17.08.2022.
//

import UIKit

class BKContainerVC: UIViewController {
    
    var randomBrew: [RandomBrew]!
    
    let titleLabel = BKTitleLabel(textAlignment: .center, fontSize: 30)
    let brewImageView = BKImageView(frame: .zero)
    let taglineLabel = BKTitleLabel(textAlignment: .center, fontSize: 25)
    let firstBrewedLabel = BKFeatureLabel(fontSize: 25)
    let abvLabel = BKFeatureLabel(fontSize: 20)
    let ibuLabeL = BKFeatureLabel(fontSize: 20)
    let targetOGLabel = BKFeatureLabel(fontSize: 20)
    let stackView = UIStackView()
    
    init(randomBrew: [RandomBrew]) {
        super.init(nibName: nil, bundle: nil)
        self.randomBrew = randomBrew
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureStackView()
        configureUIElements()
    }
    
    
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(brewImageView)
        view.addSubview(taglineLabel)
        view.addSubview(firstBrewedLabel)
        view.addSubview(stackView)
        view.addSubview(abvLabel)
        view.addSubview(ibuLabeL)
        view.addSubview(targetOGLabel)
    }
    
    func layoutUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = Colors.containerViewBackgroundColor
        view.layer.cornerRadius = 10
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            brewImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            brewImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            brewImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            brewImageView.heightAnchor.constraint(equalToConstant: 300),
            
            taglineLabel.topAnchor.constraint(equalTo: brewImageView.bottomAnchor, constant: 30),
            taglineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            taglineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            taglineLabel.heightAnchor.constraint(equalToConstant: 30),
            
            firstBrewedLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 30),
            firstBrewedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstBrewedLabel.widthAnchor.constraint(equalToConstant: 150),
            firstBrewedLabel.heightAnchor.constraint(equalToConstant: 80),
            stackView.topAnchor.constraint(equalTo: firstBrewedLabel.bottomAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureStackView() {
        stackView.addArrangedSubview(abvLabel)
        stackView.addArrangedSubview(targetOGLabel)
        stackView.addArrangedSubview(ibuLabeL)
        stackView.axis          = .horizontal
        stackView.distribution  = .equalCentering
    }
    
    func configureUIElements() {
        titleLabel.text = randomBrew[0].name
        brewImageView.downloadImage(from: randomBrew[0].imageUrl ?? Placeholders.placeholderImageURL)
        taglineLabel.text = randomBrew[0].tagline
        firstBrewedLabel.text = "First Brewed \n \(randomBrew[0].firstBrewed)"
        abvLabel.text = "ABV \n \(randomBrew[0].abv)"
        ibuLabeL.text = "IBU \n \(randomBrew[0].ibu)"
        targetOGLabel.text = "Target OG \n \(randomBrew[0].targetOg)"
        
    }
    
}
