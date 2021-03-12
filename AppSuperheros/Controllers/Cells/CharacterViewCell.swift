//
//  CharacterViewCell.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 25/2/21.
//

import UIKit
import Kingfisher

class CharacterViewCell: UITableViewCell{
    
    // MARK: - IBOutlet
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var realFullNameCell: UILabel!
    @IBOutlet weak var logoCell: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCharacterCell(view: viewCell)
        customImage(image: imageCell)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
        nameCell.text = nil
        realFullNameCell.text = nil
        logoCell.image = nil
    }
    
    func configure(photo: String?, name: String?, realFullName: String?, logo: String?, tipo: CharacterType){
        
        imageCell.kf.setImage(with: URL(string: photo ?? ""))
        nameCell.text = name
        realFullNameCell.text = realFullName
        logoCell.image = UIImage(named: logo ?? "")
        
        if (name == "" || name == nil) { nameCell.text = "-" }
        if (photo == "" || photo == nil) { imageCell.kf.setImage(with: URL(string: "https://homefinder.com.my/wp-content/uploads/2016/03/marvel_superheroes.jpg"))}
        
        customViewAligment(type: tipo, view: viewCell)
    }
}
