//
//  SuperpowersViewCell.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 26/2/21.
//

import UIKit

class SuperpowersViewCell: UITableViewCell{
    
    // MARK: - IBOtulet
    @IBOutlet weak var superView: UIView!
    
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var intelligenceImage: UIImageView!
    @IBOutlet weak var intelligencePercentage: UILabel!
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var strengthImage: UIImageView!
    @IBOutlet weak var strengthPercentage: UILabel!
    
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var durabilityImage: UIImageView!
    @IBOutlet weak var durabilityPercentage: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedImage: UIImageView!
    @IBOutlet weak var speedPercentage: UILabel!
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerImage: UIImageView!
    @IBOutlet weak var powerPercentage: UILabel!
    
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var combatImage: UIImageView!
    @IBOutlet weak var combatPercentage: UILabel!
   
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        superView.layer.backgroundColor = UIColor.clear.cgColor
        
        intelligenceLabel.text = "Intelligence"
        strengthLabel.text = "Strength"
        durabilityLabel.text = "Durability"
        speedLabel.text = "Speed"
        powerLabel.text = "Power"
        combatLabel.text = "Combat"
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        intelligenceImage.image = nil
        intelligencePercentage.text = nil
        
        strengthImage.image = nil
        strengthPercentage.text = nil
        
        durabilityImage.image = nil
        durabilityPercentage.text = nil
        
        speedImage.image = nil
        speedPercentage.text = nil
        
        powerImage.image = nil
        powerPercentage.text = nil

        combatImage.image = nil
        combatPercentage.text = nil
        
    }
    
    func configure(intelligenceImage: String?, intelligencePercentage: String?, strengthImage: String?, strengthPercentage: String?, durabilityImage: String?, durabilityPercentage: String?, speedImage: String?, speedPercentage: String?, powerImage: String?, powerPercentage: String?, combatImage: String?, combatPercentage: String?){
        
        self.intelligenceImage.image = UIImage(named: intelligenceImage ?? "")
        self.intelligencePercentage.text = intelligencePercentage
        
        self.strengthImage.image = UIImage(named: strengthImage ?? "")
        self.strengthPercentage.text = strengthPercentage
        
        self.durabilityImage.image = UIImage(named: durabilityImage ?? "")
        self.durabilityPercentage.text = durabilityPercentage
        
        self.speedImage.image = UIImage(named: speedImage ?? "")
        self.speedPercentage.text = speedPercentage
        
        self.powerImage.image = UIImage(named: powerImage ?? "")
        self.powerPercentage.text = powerPercentage
    
        self.combatImage.image = UIImage(named: combatImage ?? "")
        self.combatPercentage.text = combatPercentage
        
    }
    
}
