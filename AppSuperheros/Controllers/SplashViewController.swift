//
//  SplashViewController.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 11/3/21.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var animation: UIView!
    
    private var loading: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        loadData()
    }
    
    private func configureViews() {
        loading = .init(name: "circle")
        loading?.frame = animation.bounds
        loading?.contentMode = .scaleAspectFit
        loading?.loopMode = .playOnce
        
        if let loadingAnimation = loading {
            animation.addSubview(loadingAnimation)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        DataProvider.shared.loadCharacterObserver = nil
        super.viewWillDisappear(animated)
    }
    
    private func loadData() {
        // Load initial DATA
        DataProvider.shared.loadCharacterObserver = { [weak self] progress in
                print("\(progress * 100) %")
            self?.loading?.play(toProgress: CGFloat(progress))
                
            if progress >= 0.9 {
                    self?.performSegue(withIdentifier: "FROM_SPLASH_TO_MAIN",
                                       sender: nil)
                }
            
        }
        DataProvider.shared.initData()
    }
}
