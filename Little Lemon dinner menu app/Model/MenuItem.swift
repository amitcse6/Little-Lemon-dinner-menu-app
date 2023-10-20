//
//  Menu.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID()
    var price: Double
    var title: String
    var category: MenuCategory
    var orderCount: Int
    var ingredient: Ingredient
    var icon: String
    var isMostPopular: Bool
}
