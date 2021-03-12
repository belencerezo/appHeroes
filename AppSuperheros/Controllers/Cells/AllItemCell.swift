//
//  FavouriteItemCell.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 9/3/21.
//

import UIKit

class AllItemCell: UICollectionViewCell{
    
    // MARK: - IBOutlet
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var nameItem: UILabel!
    @IBOutlet weak var viewItem: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCharacterCell(view: viewItem)
        customImage(image: imageItem)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageItem.image = nil
        nameItem.text = nil
    }
    
    func configure(photo: String?, name: String?, tipo: CharacterType){
        
        imageItem.kf.setImage(with: URL(string: photo ?? ""))
        nameItem.text = name
        customViewAligment(type: tipo, view: viewItem)
        
    }
}
