//
//  AppRouter.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 17.04.2022.
//


import UIKit

protocol Router {
    typealias Route = SceneDelegate.Router
    
    var viewController: SceneDelegate! { get }
    init(viewController: SceneDelegate)
    
    func navigate(to route: Route)
}

class DefaultRouter: Router {
    weak var viewController: SceneDelegate!

    required init(viewController: SceneDelegate) {
        self.viewController = viewController
    }
    
    func navigate(to route: Route) {
        guard let route = SceneDelegate.Router(rawValue: route.rawValue)  else {
        return
        }
        switch route {
        case .menu:
            let menuController = RickAndMortyMenuViewController()
            viewController.window?.rootViewController = UINavigationController(rootViewController: menuController)
        }
    }
    
}
