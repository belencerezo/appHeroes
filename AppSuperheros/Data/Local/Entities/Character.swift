//
//  Character.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 1/3/21.
//

import Foundation

enum CharacterType: String, Codable {
    case hero = "good"
    case neutral = "neutral"
    case villain = "bad"
}

enum CharacterPublisher: String, Codable {
    case dc = "DC Comics"
    case other = ""
    case marvel = "Marvel Comics"
}

class Character: Codable, CustomStringConvertible {
    var id, name: String?
    var powerstats: Powerstats?
    var biography: Biography?
    var appearance: Appearance?
    var work: Work?
    var connections: Connections?
    var image: Image?
    
    var description: String {
        "\(String(describing: id)) \(String(describing: name))"
    }

    init(id: String?, name: String?, powerstats: Powerstats?, biography: Biography?, appearance: Appearance?, work: Work?, connections: Connections?, image: Image?) {
        self.id = id
        self.name = name
        self.powerstats = powerstats
        self.biography = biography
        self.appearance = appearance
        self.work = work
        self.connections = connections
        self.image = image
    }
}

// MARK: - Appearance
class Appearance: Codable {
    var gender, race: String?
    var height, weight: [String]?
    var eyeColor, hairColor: String?

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }

    init(gender: String?, race: String?, height: [String]?, weight: [String]?, eyeColor: String?, hairColor: String?) {
        self.gender = gender
        self.race = race
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}

// MARK: - Biography
class Biography: Codable {
    var fullName, alterEgos: String?
    var aliases: [String]?
    var placeOfBirth, firstAppearance: String?
    var publisher: CharacterPublisher?
    var alignment: CharacterType?
    
    var logoPublisher : String {
        switch publisher {
            case .marvel:
                return "ic_marvel"
            case .dc:
                return "ic_dc"
            default:
                return ""
        }
    }

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher, alignment
    }

    init(fullName: String?, alterEgos: String?, aliases: [String]?, placeOfBirth: String?, firstAppearance: String?, publisher: CharacterPublisher, alignment: CharacterType?) {
        self.fullName = fullName
        self.alterEgos = alterEgos
        self.aliases = aliases
        self.placeOfBirth = placeOfBirth
        self.firstAppearance = firstAppearance
        self.publisher = publisher
        self.alignment = alignment
    }
}

// MARK: - Connections
class Connections: Codable {
    var groupAffiliation, relatives: String?

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }

    init(groupAffiliation: String?, relatives: String?) {
        self.groupAffiliation = groupAffiliation
        self.relatives = relatives
    }
}

// MARK: - Image
class Image: Codable {
    var url: String? = "https://homefinder.com.my/wp-content/uploads/2016/03/marvel_superheroes.jpg"

    init(url: String? ) {
        self.url = url
    }
}

// MARK: - Powerstats
class Powerstats: Codable {
    var intelligence, strength, speed, durability: String?
    var power, combat: String?

    init(intelligence: String?, strength: String?, speed: String?, durability: String?, power: String?, combat: String?) {
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
    }
}

// MARK: - Work
class Work: Codable {
    var occupation, base: String?

    init(occupation: String?, base: String?) {
        self.occupation = occupation
        self.base = base
    }
}
