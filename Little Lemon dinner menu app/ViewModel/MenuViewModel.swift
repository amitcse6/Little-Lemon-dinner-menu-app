//
//  MenuViewModel.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import Foundation

class MenuViewModel: ObservableObject {
    @Published var menuItemList: [MenuItem] = []
    
    private var foods: [MenuItem] {
        return [
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Food", category: .food, orderCount: 0, ingredient: .broccoli, icon: "")
        ]
    }
    
    private var drinks: [MenuItem] {
        return [
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Drink", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
        ]
    }
    
    private var desserts: [MenuItem] {
        return [
            MenuItem(price: 10, title: "Dessert", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Dessert", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Dessert", category: .food, orderCount: 0, ingredient: .broccoli, icon: ""),
            MenuItem(price: 10, title: "Dessert", category: .food, orderCount: 0, ingredient: .broccoli, icon: "")
        ]
    }
    
    func fetchMenuItemList() {
        var items: [MenuItem] = []
        items.append(contentsOf: foods)
        items.append(contentsOf: drinks)
        items.append(contentsOf: desserts)
        self.menuItemList = items
    }
}
