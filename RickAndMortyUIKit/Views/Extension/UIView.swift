//
//  UIView.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import UIKit

extension UIView {
    func prepareForLayout(views: [UIView]) {
        views.forEach { self.prepareForLayout(view: $0) }
    }
    
    func prepareForLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}
