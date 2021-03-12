//
//  ApiService.swift
//  AppSuperheros
//
//  Created by Bel Cerezo on 10/3/21.
//

import Foundation
import Alamofire

//https con nuestro token
let apiToken = "3213036805462687"
let baseURL = {
    String.init(format: "https://superheroapi.com/api/%@",
                arguments: [apiToken])
}()

let apiCharacterId = "/%@"
let apiPowerstatsUrl = "/%@/powerstats"
let apiBiographyUrl = "/%@/biography"
let apiAppearanceUrl = "/%@/appearance"
let apiWorkUrl = "/%@/work"
let apiConnectionsUrl = "/%@/connections"
let apiImagesUrl = "/%@/image"
let apiSearchUrl = "/search/%@"

enum ServiceResult {
    case success(data: Any?)
    case failure(error: String?)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()

class ApiService {
    static let shared = {
        ApiService()
    }()
    private init() {}
    
    // MARK: -Services-
    func fetchHero(by id: String, completion: @escaping ServiceCompletion){
        let urlCharacterId = String.init(format: apiCharacterId,
                                         arguments: [id])
        
        AF.request("\(baseURL)\(urlCharacterId)",
                   method: .get,
                   encoding: URLEncoding.default).responseDecodable { (response: DataResponse<Character, AFError>) in
                    
                    if let error = response.error {
                        completion(.failure(error: error.localizedDescription))
                    } else {
                        completion(.success(data: response.value))
                    }
                   }
    }
}
