//
//  Menu.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import Foundation

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var category: MenuCategory
    var items: [Item] 
}
