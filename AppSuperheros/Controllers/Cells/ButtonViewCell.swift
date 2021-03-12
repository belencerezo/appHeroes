//
//  ButtonViewCell.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 26/2/21.
//

import UIKit

class ButtonViewCell: UITableViewCell{
    
    // MARK: - IBOtulet
    @IBOutlet weak var fondoButton: UIView!
    
    // MARK: - IBAction
    @IBAction func buttonFav(_ sender: UIButton){
        
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fondoButton.layer.backgroundColor = UIColor.clear.cgColor
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(){
        
    }
    
}
