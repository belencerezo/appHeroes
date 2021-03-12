//
//  InfoViewCell.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 26/2/21.
//

import UIKit
import Lottie

class InfoViewCell: UITableViewCell{
    // MARK: - IBOtulet
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var genderTitle: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var raceTitle: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var fullnameTitle: UILabel!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var workTitle: UILabel!
    @IBOutlet weak var work: UILabel!
    
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var animationIntelligence: UIView!
    @IBOutlet weak var intelligencePercentage: UILabel!
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var animationStrength: UIView!
    @IBOutlet weak var strengthPercentage: UILabel!
    
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var animationDurability: UIView!
    @IBOutlet weak var durabilityPercentage: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var animationSpeed: UIView!
    @IBOutlet weak var speedPercentage: UILabel!
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var animationPower: UIView!
    @IBOutlet weak var powerPercentage: UILabel!
    
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var animationCombat: UIView!
    @IBOutlet weak var combatPercentage: UILabel!
    
    // MARK: - IBAction
    // MARK: -Properties
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        infoView.layer.backgroundColor = UIColor.clear.cgColor
        genderTitle.text = NSLocalizedString("gender", comment: "")
        raceTitle.text = NSLocalizedString("race", comment: "")
        heightTitle.text = NSLocalizedString("height", comment: "")
        weightTitle.text = NSLocalizedString("weight", comment: "")
        workTitle.text = NSLocalizedString("work", comment: "")
        fullnameTitle.text = NSLocalizedString("fullname", comment: "")
        intelligenceLabel.text = NSLocalizedString("int", comment: "")
        strengthLabel.text = NSLocalizedString("str", comment: "")
        durabilityLabel.text = NSLocalizedString("dur", comment: "")
        speedLabel.text = NSLocalizedString("speed", comment: "")
        powerLabel.text = NSLocalizedString("power", comment: "")
        combatLabel.text = NSLocalizedString("combat", comment: "")
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gender.text = nil
        race.text = nil
        height.text = nil
        weight.text = nil
        
        intelligencePercentage.text = nil
        animationIntelligence = nil
        animationStrength = nil
        strengthPercentage.text = nil
        animationDurability = nil
        durabilityPercentage.text = nil
        animationSpeed = nil
        speedPercentage.text = nil
        animationPower = nil
        powerPercentage.text = nil
        animationCombat = nil
        combatPercentage.text = nil
    }
    
    func configure(gender: String?, race: String?, height: String?, weight: String?, fullname: String?, work: String?, intelligencePercentage: String?, strengthPercentage: String?, durabilityPercentage: String?, speedPercentage: String?, powerPercentage: String?, combatPercentage: String?){
        self.gender.text = gender
        self.race.text = race
        self.height.text = height
        self.weight.text = weight
        self.fullname.text = fullname
        self.work.text = work
        
        self.animationProgress(frameAnimationView: animationIntelligence, endFrame: parse(powerstat: intelligencePercentage))
        self.intelligencePercentage.text = "\(intelligencePercentage ?? "0")%"
        
        self.animationProgress(frameAnimationView: animationStrength, endFrame: parse(powerstat: strengthPercentage))
        self.strengthPercentage.text = "\(strengthPercentage ?? "0")%"
        
        self.animationProgress(frameAnimationView: animationDurability, endFrame: parse(powerstat: durabilityPercentage))
        self.durabilityPercentage.text = "\(durabilityPercentage ?? "0")%"
        
        self.animationProgress(frameAnimationView: animationSpeed, endFrame: parse(powerstat: speedPercentage))
        self.speedPercentage.text = "\(speedPercentage ?? "0")%"
        
        self.animationProgress(frameAnimationView: animationPower, endFrame: parse(powerstat: powerPercentage))
        self.powerPercentage.text = "\(powerPercentage ?? "0")%"
    
        self.animationProgress(frameAnimationView: animationCombat, endFrame: parse(powerstat: combatPercentage))
        self.combatPercentage.text = "\(combatPercentage ?? "0")%"
    }
    
    private func parse(powerstat: String?) -> CGFloat {
        CGFloat(((Int(powerstat ?? "0") ?? 0) * 99) / 100)
    }
}
