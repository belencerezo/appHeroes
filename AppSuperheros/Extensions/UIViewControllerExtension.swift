//
//  UIViewControllerExtension.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 4/3/21.
//
import UIKit
import Lottie

extension UIViewController {
    
    func filterActionSheet(allFilter: ((UIAlertAction) -> Void)? = nil, dcFilter: ((UIAlertAction) -> Void)? = nil, marvelFilter: ((UIAlertAction) -> Void)? = nil, neutralFilter: ((UIAlertAction) -> Void)? = nil) {
        
        let actionSheet = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("all", comment: ""),
                                            style: .default,
                                            handler: allFilter))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("dc", comment: ""),
                                            style: .default,
                                            handler: dcFilter))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("marvel", comment: ""),
                                            style: .default,
                                            handler: marvelFilter))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("others", comment: ""),
                                            style: .default,
                                            handler: neutralFilter))
        
        present(actionSheet, animated: true)
    }
    
    func backgroundStyle(type: CharacterType?, background: UIImageView) {
        switch type {
            case .hero:
                background.image = UIImage(named: "ciudadBuena")
                
            case .neutral:
                background.image = UIImage(named: "ciudadNeutra")
                
            case .villain:
                background.image = UIImage(named: "ciudadMala")
            default:
                break
        }
    }
}
