//
//  MenuRouter.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 17.04.2022.
//

import Foundation
import UIKit

protocol MenuRouter {
    typealias Route = RickAndMortyMenuViewController.MenuRoute
    
    var viewController: RickAndMortyMenuViewController! { get }
    init(viewController: RickAndMortyMenuViewController)
    
    func navigate(to route: Route, viewModel: HeroDetailViewModel?)
}

class DefaultMenuRouter: MenuRouter {
   
    weak var viewController: RickAndMortyMenuViewController!

    required init(viewController: RickAndMortyMenuViewController) {
        self.viewController = viewController
    }
    
    func navigate(to route: Route, viewModel: HeroDetailViewModel? = nil) {
        guard let route = RickAndMortyMenuViewController.MenuRoute(rawValue: route.rawValue)  else {
        return
        }
        switch route {
        case .detailView:
            let detailView = RickAndMortyDetailViewController()
            detailView.viewModel = viewModel
            viewController.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
}
