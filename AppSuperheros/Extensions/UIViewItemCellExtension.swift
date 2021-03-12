//
//  UIViewItemCellExtension.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 10/3/21.
//

import UIKit

extension UICollectionViewCell {
    
    func customCharacterCell (view: UIView){
        view.layer.cornerRadius = 8.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 0.4
        view.layer.borderWidth = 2
        view.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func customImage(image: UIImageView){
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.masksToBounds = true
    }
    
    func customViewAligment(type: CharacterType?, view: UIView ) {
        switch type {
            case .hero:
                view.layer.borderColor = UIColor(named: "verde")?.cgColor
            case .neutral:
                view.layer.borderColor = UIColor(named: "azul")?.cgColor
            case .villain:
                view.layer.borderColor = UIColor(named: "rojo")?.cgColor
            default:
                break
        }
    }
    
}
