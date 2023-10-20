//
//  SortedMenuItem.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 20/10/23.
//

import Foundation

enum SortedMenuItem: String, CaseIterable, Codable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case aToz = "A-Z"
}
