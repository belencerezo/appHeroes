//
//  NeutralsController.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 25/2/21.
//

import UIKit

class NeutralsViewController: UIViewController {
    // MARK: - IBOtulet
    @IBOutlet weak var tableNeutrals: UITableView!
    @IBOutlet weak var filterNeutral: UIBarButtonItem!
    @IBOutlet weak var searchNeutral: UISearchBar!
    
    // MARK: - IBAction
    @IBAction func filterPressed(_ sender: UIButton){
        filterActionSheet(allFilter: { [weak self]_ in
            self?.neutralsFiltered = DataProvider.shared.neutrals
            self?.tableNeutrals.reloadData()
        },
        dcFilter: { [weak self]_ in
            self?.neutralsFiltered = DataProvider.shared.filter(list: DataProvider.shared.neutrals, characterPublisher: .dc)
            self?.tableNeutrals.reloadData()
        },
        marvelFilter: { [weak self]_ in
            self?.neutralsFiltered = DataProvider.shared.filter(list: DataProvider.shared.neutrals, characterPublisher: .marvel)
            self?.tableNeutrals.reloadData()
        },
        neutralFilter: { [weak self]_ in
            self?.neutralsFiltered = DataProvider.shared.filterOthers(list: DataProvider.shared.neutrals, contains1: .dc, contains2: .marvel)
            self?.tableNeutrals.reloadData()
        })
    }
    // MARK: - Properties
    var neutralsFiltered : [Character] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        neutralsFiltered = DataProvider.shared.neutrals
        
        tableNeutrals.delegate = self
        tableNeutrals.dataSource = self
        searchNeutral.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DescriptionViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableNeutrals.indexPath(for: cell) else{
            return
        }
        
        if(indexPath.row < neutralsFiltered.count){
            let characterSelected = neutralsFiltered[indexPath.row]
            destination.character = characterSelected
        }
    }
}
extension NeutralsViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        neutralsFiltered.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell", for: indexPath) as? CharacterViewCell
        
        if(indexPath.row < neutralsFiltered.count){
            let data = neutralsFiltered[indexPath.row]
            cell?.configure(photo: data.image?.url,
                            name: data.name ?? "",
                            realFullName: data.biography?.fullName ?? "",
                            logo: data.biography?.logoPublisher,
                            tipo: data.biography?.alignment ?? .neutral)
        }
        return cell ?? UITableViewCell()
    }
    
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String) {
        neutralsFiltered = []
        
        if searchText == "" {
            neutralsFiltered = DataProvider.shared.neutrals
        }else{
            for character in DataProvider.shared.neutrals {
                if ((character.name?.lowercased().contains(searchText.lowercased())) ?? false) {
                    neutralsFiltered.append(character)
                }
            }
        }
        self.tableNeutrals.reloadData()
    }
}
