//
//  MenuViewModel.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import Foundation

struct MenuOption: Identifiable {
    var id = UUID()
    var title: String
    var isSelected: Bool
}

class MenuViewModel: ObservableObject {
    @Published var menuItemList: [MenuCategory : [MenuItem]] = [:]
    @Published var selectedMenuItemList: [MenuOption] = []
    @Published var sortedMenuItemList: [MenuOption] = []
    
    func getMenuItemListBy(category: MenuCategory) -> [MenuItem] {
        return menuItemList[category] ?? []
    }
    
    func isAnyItemAvailable() -> Bool {
        return MenuCategory.allCases.map { cat in
            return getMenuItemListBy(category: cat).count > 0
        }.filter({$0}).count > 0
    }
    
    func reloadAll() {
        reloadMenuItemList()
        reloadSelectedMenuItemList()
        reloadSortedMenuItemList()
        filterData()
    }
    
    func filterData() {
        menuItemList.forEach({ key, list in
            menuItemList[key] = list.filter({ item in
                let catList = selectedMenuItemList.filter { option in
                    return option.title.elementsEqual(item.category.rawValue) && option.isSelected
                }
                return catList.count > 0
            })
        })
        
        sortedMenuItemList.forEach { option in
            if option.isSelected {
                menuItemList.forEach({ key, list in
                    menuItemList[key] = menuItemList[key]?.sorted(by: { item1, item2 in
                        if option.title.elementsEqual(SortedMenuItem.mostPopular.rawValue) {
                            return item1.isMostPopular && !item2.isMostPopular
                        }else if option.title.elementsEqual(SortedMenuItem.price.rawValue) {
                            return item1.price > item2.price
                        }else {
                            return item1.title > item2.title
                        }
                    }) ?? []
                })
            }
        }
    }
    
    private func reloadMenuItemList() {
        menuItemList = DataStorage.shared.menuItemList
    }
    
    private func reloadSelectedMenuItemList() {
        selectedMenuItemList = MenuCategory.allCases.map({ item in
            let catList = DataStorage.shared.selectedMenuItemList.filter { cat in
                return item.rawValue.elementsEqual(cat.rawValue)
            }
            return MenuOption(title: item.rawValue, isSelected: catList.count > 0)
        })
    }
    
    private func reloadSortedMenuItemList() {
        sortedMenuItemList = SortedMenuItem.allCases.map({ item in
            let catList = DataStorage.shared.sortedMenuItemList.filter { cat in
                return item.rawValue.elementsEqual(cat.rawValue)
            }
            return MenuOption(title: item.rawValue, isSelected: catList.count > 0)
        })
    }
}

extension MenuViewModel {
    func changeSelectedMenuItemList(_ tapItem: String) {
        MenuCategory.allCases.forEach({ item in
            if item.rawValue.elementsEqual(tapItem) {
                let catList = DataStorage.shared.selectedMenuItemList.filter { cat in
                    return item.rawValue.elementsEqual(cat.rawValue)
                }
                if let cat = catList.first {
                    DataStorage.shared.selectedMenuItemList.removeAll(where: {$0.rawValue.elementsEqual(cat.rawValue)})
                }else {
                    DataStorage.shared.selectedMenuItemList.append(item)
                }
            }
        })
        reloadSelectedMenuItemList()
    }
    
    func changeSortedMenuItemList(_ tapItem: String) {
        SortedMenuItem.allCases.forEach({ item in
            if item.rawValue.elementsEqual(tapItem) {
                let catList = DataStorage.shared.sortedMenuItemList.filter { cat in
                    return item.rawValue.elementsEqual(cat.rawValue)
                }
                if let cat = catList.first {
                    DataStorage.shared.sortedMenuItemList.removeAll(where: {$0.rawValue.elementsEqual(cat.rawValue)})
                }else {
                    DataStorage.shared.sortedMenuItemList.append(item)
                }
            }
        })
        reloadSortedMenuItemList()
    }
}
