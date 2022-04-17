//
//  HeroesViewModel.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import UIKit
import Alamofire
import AlamofireImage

class HeroesViewModel: NSObject {
    
    private var apiService: Service!
    private var heroes: [Hero]?
    private var imageHeroes = [HeroViewModelCell]()
    private var selectedIndexPath: IndexPath?
    private var heroId: HeroDetailViewModel?
    private var nextUrl = "https://rickandmortyapi.com/api/character"
    
    
    
    override init() {
        super.init()
        apiService = Service()
    }
    
    func fetchHeroes(completion: @escaping() -> ()) {
        self.apiService.downloadItem(url: "https://rickandmortyapi.com/api/character", completionHandler: { (data) in
            self.heroes = data
            completion()
        })
    }
    
    func numberOfRowInSection() -> Int {
        return heroes?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HeroViewModelCell? {
        guard let heroes = heroes else {return nil}
        let hero = heroes[indexPath.row]
        return HeroViewModelCell(heroes: hero)
    }
    
    
    func viewModelForSelectedRow() -> HeroDetailViewModel? {
        guard let selectIndexPath = selectedIndexPath else { return nil}
        guard let heroes = heroes else {return nil}
        return HeroDetailViewModel(hero: heroes[selectIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func nextPage(completion: @escaping() -> ()) {
        self.apiService.downloadNextPage(url: nextUrl, completionHandler: { (data) in
            self.nextUrl = data.next
            completion()
        })
    }
    
    func fetchNextPage(page: Int, completion: @escaping() -> ()) {
        self.apiService.downloadItemOfPage(page: page, completionHandler: { (data) in
            self.heroes! += data
            completion()
        })
    }
}
