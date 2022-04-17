//
//  Info.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 17.04.2022.
//

import Foundation

struct InfoUrl {
    let count, pages: Int
    let next: String
    let prev: String?
    
    init?(info: Info) {
        count = info.count
        pages = info.pages
        next = info.next
        prev = info.prev
    }
}
