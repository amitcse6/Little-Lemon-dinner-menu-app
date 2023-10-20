//
//  DataManager.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 20/10/23.
//

import Foundation
import SwiftUI

class DataStorage {
    static let shared = DataStorage()
    

    var menuItemList: [MenuCategory : [MenuItem]] = [:]
    var selectedMenuItemList: [MenuCategory] {
        set {
            saveValue(value: newValue, key: "selectedMenuItemList")
        }
        get {
            return getValue(key: "selectedMenuItemList") ?? []
        }
    }
    
    var sortedMenuItemList: [SortedMenuItem]{
        set {
            saveValue(value: newValue, key: "sortedMenuItemList")
        }
        get {
            return getValue(key: "sortedMenuItemList") ?? []
        }
    }
    
    
    init() {
        fetchMenuItemList()
    }
    
    func saveValue<T: Encodable>(value: T, key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getValue<T: Decodable>(key: String) -> T? {
        if let data = UserDefaults.standard.object(forKey: key) as? Data,
           let model = try? JSONDecoder().decode(T.self, from: data) {
            return model
        }
        return nil
    }
    
    private var foods: [MenuItem] {
        return [
            MenuItem(price: 10, title: "Food 1", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 9, title: "Food 2", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 4, title: "Food 3", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 6, title: "Food 4", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 2, title: "Food 5", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 5, title: "Food 6", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 6, title: "Food 7", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 8, title: "Food 8", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 9, title: "Food 9", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 12, title: "Food 10", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 15, title: "Food 11", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 19, title: "Food 12", category: .food, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false)
        ]
    }
    
    private var drinks: [MenuItem] {
        return [
            MenuItem(price: 7, title: "Drink 1", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 10, title: "Drink 2", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 8, title: "Drink 3", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 13, title: "Drink 4", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 14, title: "Drink 5", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 16, title: "Drink 6", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 12, title: "Drink 7", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 17, title: "Drink 8", category: .drink, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
        ]
    }
    
    private var desserts: [MenuItem] {
        return [
            MenuItem(price: 10, title: "Dessert 1", category: .dessert, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 9, title: "Dessert 2", category: .dessert, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true),
            MenuItem(price: 15, title: "Dessert 3", category: .dessert, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: false),
            MenuItem(price: 14, title: "Dessert 4", category: .dessert, orderCount: 0, ingredient: .broccoli, icon: "", isMostPopular: true)
        ]
    }
    
    private func fetchMenuItemList() {
        var items: [MenuItem] = []
        items.append(contentsOf: foods)
        items.append(contentsOf: drinks)
        items.append(contentsOf: desserts)
        let group = Dictionary(grouping: items, by: { $0.category })
        menuItemList = group
    }
}
