//
//  Service.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import Alamofire


struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

enum ApiError: Error {
    case noData
    case noConnection
}

class Service: NSObject {
    
    func downloadNextPage(url: String,completionHandler: @escaping (InfoUrl) -> ()) {
        if Connectivity.isConnectedToInternet {
            AF.request(url).responseJSON { response in
                guard let data = response.data else { return }
                if let currentHeroes = self.parseJSONNextPage(withData: data ) {
                    completionHandler(currentHeroes)
                }
            }
        } else {
            print(ApiError.noConnection)
        }
    }
    
    func parseJSONNextPage(withData data: Data) -> InfoUrl? {
        let decoder = JSONDecoder()
        do {
            let currentHeroesData = try decoder.decode(HeroesData.self, from: data)
            guard let currentHeroes = InfoUrl(info: currentHeroesData.info) else { return nil }
            return currentHeroes
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    
    func downloadItem(url: String,completionHandler: @escaping ([Hero]) -> ()) {
        if Connectivity.isConnectedToInternet {
            AF.request(url).responseJSON { response in
                guard let data = response.data else { return }
                if let currentHeroes = self.parseJSON(withData: data ) {
                    completionHandler(currentHeroes)
                }
            }
        } else {
            print(ApiError.noConnection)
        }
    }
    
    
    
    func parseJSON(withData data: Data) -> [Hero]? {
        var heros = [Hero]()
        let decoder = JSONDecoder()
        do {
            let currentHeroesData = try decoder.decode(HeroesData.self, from: data)
            for itemHeroes in currentHeroesData.results {
                guard let currentHeroes = Hero(currentHeroesData: itemHeroes) else { return nil }
                heros.append(currentHeroes)
            }
            return heros
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    
    
    func downloadHero(url: String,completionHandler: @escaping (Hero) -> ()) {
        if Connectivity.isConnectedToInternet {
            AF.request(url).responseJSON { response in
                guard let data = response.data else { return }
                if let currentHeroes = self.parseJSONHero(withData: data ) {
                    completionHandler(currentHeroes)
                }
            }
        } else {
            print(ApiError.noConnection)
        }
    }
    
    func parseJSONHero(withData data: Data) -> Hero? {
        let decoder = JSONDecoder()
        do {
            let currentHeroesData = try decoder.decode(Result.self, from: data)
            guard let currentHero = Hero(currentHeroesData: currentHeroesData) else { return nil }
            return currentHero
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }

    
}
