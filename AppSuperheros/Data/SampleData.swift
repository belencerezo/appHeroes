//
//  DataExample.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 1/3/21.
//

import Foundation

var defaultCharacter: [Character] = []


//************* LOAD JSON DATA ****************

func loadCharacters() {
    guard let pathURL = Bundle.main.url(forResource: "characters", withExtension: "json") else {
        print("Can not find `characters` resource")
        return
    }
    
    do {
        let data = try Data(contentsOf: pathURL)
        defaultCharacter = try JSONDecoder().decode([Character].self, from: data)
    } catch {
        print("Can not find `characters` resource")
    }
}


