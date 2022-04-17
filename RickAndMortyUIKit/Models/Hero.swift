//
//  Hero.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import Foundation

struct Hero {
    var id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let location: String
    let image: String
    let numberOfEpisodesLabel: Int
    
    init?(currentHeroesData: Result) {
        name = currentHeroesData.name
        status = currentHeroesData.status.rawValue
        species = currentHeroesData.species
        type = currentHeroesData.type
        gender = currentHeroesData.gender.rawValue
        location = currentHeroesData.location.name
        image = currentHeroesData.image
        id = currentHeroesData.id
        numberOfEpisodesLabel = currentHeroesData.episode.count
    }
}
