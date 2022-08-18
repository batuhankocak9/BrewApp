//
//  SearchVC.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 15.08.2022.
//

import UIKit

class SearchVC: UIViewController {
    
    enum Section { case main }
    
    var brewData = [Brew]()
    var filteredBrewData = [Brew]()
    
    var page = 1
    var hasMoreBrews = true
    var isSearching = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section,Brew>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        getBrews(page: page)
        configureSearchController()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(BrewCell.self, forCellWithReuseIdentifier: BrewCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrewCell.reuseID, for: indexPath) as! BrewCell
            cell.set(brew: itemIdentifier)
            return cell
        })
    }
    
    func updateData(on brewData: [Brew]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Brew>()
        snapshot.appendSections([.main])
        snapshot.appendItems(brewData)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func getBrews(page: Int) {
        showLoadingView()
        NetworkManager.shared.getBrews(page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let brew):
                if brew.count < 50 { self.hasMoreBrews = false }
                self.brewData.append(contentsOf: brew)
                self.updateData(on: self.brewData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = Placeholders.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
}

extension SearchVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        if offsetY > contentHeight - height {
            guard hasMoreBrews else { return }
            page += 1
            getBrews(page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredBrewData : brewData
        let brew = activeArray[indexPath.item]
        
        let destVC = BrewInfoVC()
        destVC.brewID = brew.id
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}

extension SearchVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        filteredBrewData = brewData.filter { $0.name.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredBrewData)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: brewData)
    }
    
    
}
