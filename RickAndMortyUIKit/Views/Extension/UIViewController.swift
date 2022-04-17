//
//  UIViewController.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 17.04.2022.
//


import UIKit

extension UIViewController {
    func prepareForLayout(views: [UIView]) {
        views.forEach { self.prepareForLayout(view: $0) }
    }
    func prepareForLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
}
