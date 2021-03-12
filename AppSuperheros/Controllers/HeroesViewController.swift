//
//  HeroesController.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 25/2/21.
//

import UIKit

class HeroesViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableHeroes: UITableView!
    @IBOutlet weak var filterHero: UIBarButtonItem!
    @IBOutlet weak var searchHero: UISearchBar!
    
    // MARK: - IBAction
    @IBAction func filterPressed(_ sender: UIButton){
        filterActionSheet(allFilter: { [weak self]_ in
            self?.goodsFiltered = DataProvider.shared.goods
            self?.tableHeroes.reloadData()
        },
        dcFilter: { [weak self]_ in
            //self?.goodsFiltered = DataProvider.shared.goods
            self?.goodsFiltered = DataProvider.shared.filter(list: DataProvider.shared.goods, characterPublisher: .dc)
            self?.tableHeroes.reloadData()
        },
        marvelFilter: { [weak self]_ in
            //self?.goodsFiltered = DataProvider.shared.goods
            self?.goodsFiltered = DataProvider.shared.filter(list: DataProvider.shared.goods, characterPublisher: .marvel)
            self?.tableHeroes.reloadData()
        },
        neutralFilter: { [weak self]_ in
            //self?.goodsFiltered = DataProvider.shared.goods
            self?.goodsFiltered = DataProvider.shared.filterOthers(list: DataProvider.shared.goods, contains1: .dc, contains2: .marvel)
            self?.tableHeroes.reloadData()
        })
    }
    
    // MARK: - Properties
    private var goodsFiltered : [Character] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        goodsFiltered = DataProvider.shared.goods
        
        tableHeroes.delegate = self
        tableHeroes.dataSource = self
        searchHero.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DescriptionViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableHeroes.indexPath(for: cell) else{
            return
        }
        
        if(indexPath.row < goodsFiltered.count){
            let characterSelected = goodsFiltered[indexPath.row]
            destination.character = characterSelected
        }
    }
}
extension HeroesViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goodsFiltered.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell", for: indexPath) as? CharacterViewCell
        if (indexPath.row < goodsFiltered.count){
            let data = goodsFiltered[indexPath.row]
            
            cell?.configure(photo: data.image?.url,
                            name: data.name ?? "",
                            realFullName: data.biography?.fullName ?? "",
                            logo: data.biography?.logoPublisher,
                            tipo: data.biography?.alignment ?? .hero)
        }
        return cell ?? UITableViewCell()
    }
    
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String) {
        goodsFiltered = []
        
        if searchText == "" {
            goodsFiltered = DataProvider.shared.goods
        }else{
            for character in DataProvider.shared.goods {
                if ((character.name?.lowercased().contains(searchText.lowercased())) ?? false) {
                    goodsFiltered.append(character)
                }
            }
        }
        self.tableHeroes.reloadData()
    }
}
