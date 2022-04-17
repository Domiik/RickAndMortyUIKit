//
//  HeroViewModelCell.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import UIKit


class HeroViewModelCell: NSObject {
    private var heroes: Hero
    private var apiService: Service
    
    init(heroes: Hero) {
        self.heroes = heroes
        apiService = Service()
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
    
    
}
