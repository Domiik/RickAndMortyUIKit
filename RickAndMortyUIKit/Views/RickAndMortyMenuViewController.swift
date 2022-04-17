//
//  ViewController.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import UIKit
import SnapKit

class RickAndMortyMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var isLoading = false
    
    enum MenuRoute: String {
        case detailView
    }
    
    private var heroesViewModel = HeroesViewModel()
    private var router: MenuRouter!
    
    lazy var tbl: UITableView = {
        let v = UITableView()
        v.rowHeight = 150
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
        title = "Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(RickAndMortyTableViewCell.self, forCellReuseIdentifier: RickAndMortyTableViewCell.cellId)
        self.view.addSubview(tbl)
        tbl.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
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
    
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        let position = scrollView.contentOffset.y
    //        if position > (tbl.contentSize.height - 100 - scrollView.frame.size.height){
    //            heroesViewModel.nextPage { }
    //            heroesViewModel.fetchNextPage {
    //                self.tbl.reloadData()
    //            }
    //        }
    //    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        heroesViewModel.nextPage { }
//        heroesViewModel.fetchNextPage {
//            self.tbl.reloadData()
//        }
//    }
    
    private func createSpinnerFooter() -> UIView {
          let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
          
          let spinner = UIActivityIndicatorView()
          spinner.center = footerView.center
          footerView.addSubview(spinner)
          spinner.startAnimating()
          
          return footerView
      }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tbl.contentSize.height - 100 - scrollView.frame.size.height) {
            // fetch more data
            guard !apiCaller.isPaginating else {
                // we are already fetch more data
                return
            }
            self.tbl.tableFooterView = createSpinnerFooter()
            self.heroesViewModel.nextPage { }
            heroesViewModel.fetchNextPage {
                self.tbl.reloadData()
                
            }
        }
    }
    
    func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                // Fake background loading task for 2 seconds
                sleep(2)
                self.heroesViewModel.nextPage { }
                self.heroesViewModel.fetchNextPage {
                    
                }
                // Download more data here
                DispatchQueue.main.async {
                    self.tbl.reloadData()
                    self.isLoading = false
                }
            }
        }
    }
}

