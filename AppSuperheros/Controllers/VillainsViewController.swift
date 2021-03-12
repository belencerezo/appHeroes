//
//  VilliansViewController.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 25/2/21.
//

import UIKit

class VillainsViewController: UIViewController{
    // MARK: - IBOtulet
    @IBOutlet weak var tableVillains: UITableView!
    @IBOutlet weak var filterVillain: UIBarButtonItem!
    @IBOutlet weak var searchVillain: UISearchBar!
    
    // MARK: - IBAction
    @IBAction func filterPressed(_ sender: UIButton){
        filterActionSheet(allFilter: { [weak self]_ in
            self?.badsFiltered = DataProvider.shared.bads
            self?.tableVillains.reloadData()
        },
        dcFilter: { [weak self]_ in
            self?.badsFiltered = DataProvider.shared.filter(list: DataProvider.shared.bads, characterPublisher: .dc)
            self?.tableVillains.reloadData()
        },
        marvelFilter: { [weak self]_ in
            self?.badsFiltered = DataProvider.shared.filter(list: DataProvider.shared.bads, characterPublisher: .marvel)
            self?.tableVillains.reloadData()
        },
        neutralFilter: { [weak self]_ in
            self?.badsFiltered = DataProvider.shared.filterOthers(list: DataProvider.shared.bads, contains1: .dc, contains2: .marvel)
            self?.tableVillains.reloadData()
        })
    }
    // MARK: - Properties
    private var badsFiltered : [Character] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        badsFiltered = DataProvider.shared.bads
        
        tableVillains.delegate = self
        tableVillains.dataSource = self
        searchVillain.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DescriptionViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableVillains.indexPath(for: cell) else{
            return
        }
        
        if(indexPath.row < badsFiltered.count){
            let characterSelected = badsFiltered[indexPath.row]
            destination.character = characterSelected
        }
    }
}
extension VillainsViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        badsFiltered.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell", for: indexPath) as? CharacterViewCell
        
        if(indexPath.row < badsFiltered.count){
            let data = badsFiltered[indexPath.row]
            cell?.configure(photo: data.image?.url,
                            name: data.name ?? "",
                            realFullName: data.biography?.fullName ?? "",
                            logo: data.biography?.logoPublisher,
                            tipo: data.biography?.alignment ?? .villain)
        }
        return cell ?? UITableViewCell()
    }
    
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String) {
        badsFiltered = []
        
        if searchText == "" {
            badsFiltered = DataProvider.shared.bads
        }else{
            for character in DataProvider.shared.bads {
                if ((character.name?.lowercased().contains(searchText.lowercased())) ?? false) {
                    badsFiltered.append(character)
                }
            }
        }
        self.tableVillains.reloadData()
    }
}
