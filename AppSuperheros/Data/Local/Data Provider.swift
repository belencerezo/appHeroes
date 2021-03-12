//
//  Data Provider.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 10/3/21.
//

import Foundation

/// The Data Provider class defines the `shared` field that lets clients access the
/// unique singleton instance.
class DataProvider {
    // MARK: - SINGLETON start -
    /// The static field that controls the access to the DataProvider instance.
    /// This implementation let you extend the DataProvider class while keeping
    /// just one instance of each subclass around.
    static var shared: DataProvider = {
        return DataProvider()
    }()
    
    /// The DataProvider's initializer should always be private to prevent direct
    /// construction calls with the `new` operator.
    private init() {}
    // MARK: - SINGLETON end -
    
    var defaultCharacter: [Character] = []
    
    //************* LOAD JSON DATA ****************
    
    private let characterMaxCount = 732
    var loadCharacterObserver: ((_ progress: Float) -> ())? = nil
    var loadCharacterCount = 0 {
        didSet {
            loadCharacterObserver?(Float(loadCharacterCount) / Float(characterMaxCount))
        }
    }
    
    func initData() {
        for id in 0...characterMaxCount {
            ApiService.shared.fetchHero(by: "\(id)") { [weak self] result in
                switch result {
                    case .success(let data):
                        guard let character = data as? Character,
                              !(character.id?.isEmpty ?? true),
                              !(character.image?.url?.isEmpty ?? true) else {
                            return
                        }
                        self?.defaultCharacter.append(character)
                        
                    case .failure(_):
                        break
                }
                
                self?.loadCharacterCount += 1
            }
        }
    }
    
    // Lists `goods`, `neutrals` and `bads`
    var goods : [Character] {
        defaultCharacter.filter { $0.biography?.alignment?.rawValue.contains("good") ?? false}
    }
    var neutrals : [Character] {
        defaultCharacter.filter { $0.biography?.alignment?.rawValue.contains("neutral") ?? false}
    }
    var bads : [Character] {
        defaultCharacter.filter { $0.biography?.alignment?.rawValue.contains("bad") ?? false}
    }
    
    func filter(list: [Character], characterPublisher: CharacterPublisher) -> [Character] {
        list.filter {$0.biography?.publisher?.rawValue.contains(characterPublisher.rawValue) ?? false}
    }
    
    func filterOthers(list: [Character], contains1: CharacterPublisher, contains2: CharacterPublisher) -> [Character]{
        list.filter {!($0.biography?.publisher?.rawValue.contains(contains1.rawValue) ?? false || $0.biography?.publisher?.rawValue.contains(contains2.rawValue) ?? false)}
    }
}

