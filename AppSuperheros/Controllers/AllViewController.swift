//
//  FavsViewController.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 9/3/21.
//

import UIKit

class AllViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var searchAll: UISearchBar!
    @IBOutlet weak var collectionAll: UICollectionView!
    
    // MARK: - IBAction

    
    // MARK: - Properties
    var all = DataProvider.shared.defaultCharacter.sorted {($0.name ?? "") < ($1.name ?? "")}

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAll.delegate = self
        collectionAll.dataSource = self
        searchAll.delegate = self
    }
}

extension AllViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3 - 8,
               height: collectionView.frame.width / 3 - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllItemCell", for: indexPath) as? AllItemCell
        
        if(indexPath.row < all.count){
            let data = all[indexPath.row]
            cell?.configure(photo: data.image?.url,
                            name: data.name ?? "",
                            tipo: data.biography?.alignment ?? .hero)
        }
        return cell ?? UICollectionViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       all = []
       if searchText == "" {
         all = DataProvider.shared.defaultCharacter
       }
       else{
         for character in DataProvider.shared.defaultCharacter {
           if ((character.name?.lowercased().contains(searchText.lowercased())) ?? false) {
             all.append(character)
           }
         }
       }
       self.collectionAll.reloadData()
     }
}
