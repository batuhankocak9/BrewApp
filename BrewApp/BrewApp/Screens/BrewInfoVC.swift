//
//  BrewInfoVC.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 17.08.2022.
//

import UIKit

class BrewInfoVC: UIViewController {
    
    var brewID: Int!
    let headerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureVC()
        getBrew()
    }
    
    private func configureVC() {
        view.backgroundColor = .white
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func layoutUI() {
        view.addSubview(headerView)
        headerView.frame = view.bounds
        headerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func getBrew() {
        NetworkManager.shared.getBrewInfo(forID: brewID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self.add(childVC: BKBrewInfoHeaderVC(brew: data), to: self.headerView)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
}
