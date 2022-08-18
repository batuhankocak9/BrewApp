//
//  MainVC.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 15.08.2022.
//

import UIKit

class MainVC: UIViewController {
    
    var containerView = UIView()
    
    override func viewDidLoad() {
        layoutUI()
        getRandomBrew()
    }
    
    func layoutUI() {
        view.addSubview(containerView)
        view.backgroundColor = Colors.mainPageBackgroundColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func getRandomBrew() {
        showLoadingView()
        NetworkManager.shared.getRandomBrew { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let brew):
                DispatchQueue.main.async {
                    self.add(childVC: BKContainerVC(randomBrew: brew), to: self.containerView)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
