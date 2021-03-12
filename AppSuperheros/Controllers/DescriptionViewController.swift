//
//  DescriptionViewController.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 26/2/21.
//

import UIKit
import Kingfisher

class DescriptionViewController: UIViewController{
    // MARK: - IBOtulet
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var photoCharacter: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tableDescription: UITableView!
    
    // MARK: - IBAction

    // MARK: - Properties
    var character: Character? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundStyle(type: character?.biography?.alignment, background: background)
        photoCharacter.kf.setImage(with: URL(string: character?.image?.url ?? ""))
        photoCharacter.layer.cornerRadius = photoCharacter.frame.height / 2
        name.text = character?.name
        
        tableDescription.delegate = self
        tableDescription.dataSource = self
        
    }
}
extension DescriptionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        392
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoViewCell", for: indexPath) as? InfoViewCell
        
        cell?.configure(gender: character?.appearance?.gender,
                        race: character?.appearance?.race,
                        height: character?.appearance?.height?.last,
                        weight: character?.appearance?.weight?.last,
                        fullname: character?.biography?.fullName,
                        work: character?.work?.occupation,
                        intelligencePercentage: character?.powerstats?.intelligence,
                        strengthPercentage: character?.powerstats?.strength,
                        durabilityPercentage: character?.powerstats?.durability,
                        speedPercentage: character?.powerstats?.speed,
                        powerPercentage: character?.powerstats?.power,
                        combatPercentage: character?.powerstats?.combat)
        
        return cell ?? UITableViewCell()
    }
}
