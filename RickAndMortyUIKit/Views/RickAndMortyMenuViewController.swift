//
//  ViewController.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import UIKit
import SnapKit

class RickAndMortyMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum MenuRoute: String {
        case detailView
    }
    
    private var heroesViewModel = HeroesViewModel()
    private var router: MenuRouter!
    
    var page = 1
    var hasMoreContent = true
    
    lazy var tbl: UITableView = {
        let v = UITableView()
        v.rowHeight = 200
        v.separatorStyle = .none
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = DefaultMenuRouter(viewController: self)
        self.heroesViewModel.fetchHeroes {
            self.tbl.reloadData()
            
        }
        setupUI()
        
    }
    
    func setupUI() {
        view.backgroundColor = .white
        title = "Rick and Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tbl.delegate = self
        self.tbl.dataSource = self
        self.tbl.register(RickAndMortyTableViewCell.self, forCellReuseIdentifier: RickAndMortyTableViewCell.cellId)
        self.view.addSubview(tbl)
        self.tbl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    
}

extension RickAndMortyMenuViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesViewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyTableViewCell.cellId, for: indexPath) as! RickAndMortyTableViewCell
        let cellViewModel = heroesViewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard heroesViewModel != nil else { return }
        heroesViewModel.selectRow(atIndexPath: indexPath)
        router.navigate(to: .detailView, viewModel: heroesViewModel.viewModelForSelectedRow()!)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreContent else { return }
            page += 1
            heroesViewModel.fetchNextPage(page: page, completion: {
                self.tbl.reloadData()
            })
                
            
        }
    }
}
