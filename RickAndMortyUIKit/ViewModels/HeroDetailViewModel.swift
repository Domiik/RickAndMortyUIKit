//
//  HeroDetailViewModel.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage


class HeroDetailViewModel: NSObject {
    private var heroes: Hero
    private var apiService = Service()
    
    
    init(hero: Hero) {
        self.heroes = hero
    }

    var name: String {
        return heroes.name
    }
    
    var status: String {
        return heroes.status
    }
    
    var species: String {
        return heroes.species
    }
    
    var type: String {
        return heroes.type
    }
    
    var gender: String {
        return heroes.gender
    }
    
    var location: String {
        return heroes.location
    }
    
    var image: String {
        return heroes.image
    }
    
    var numberOfEpisodesLabel: Int {
        return heroes.numberOfEpisodesLabel
    }
    
    func fetchHero(completion: @escaping() -> ()) {
        self.apiService.downloadHero(url: "https://rickandmortyapi.com/api/character/\(heroes.id)", completionHandler: { (data) in
            self.heroes = data
            completion()
        })
    }
 
}
