//
//  Little_Lemon_dinner_menu_appTests.swift
//  Little Lemon dinner menu appTests
//
//  Created by 11461_amit on 19/10/23.
//

import XCTest
@testable import Little_Lemon_dinner_menu_app

final class Little_Lemon_dinner_menu_appTests: XCTestCase {
    let viewModel = MenuViewModel()
    
    /// setUp
    override func setUp() {
        super.setUp()
        DataStorage.shared.removeAll()
    }
    
    /// tearDown
    override func tearDown() {
        super.tearDown()
        DataStorage.shared.removeAll()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSelectedMenuItemList() throws {
        DataStorage.shared.removeAll()
        viewModel.reloadAll()
        let selectedMenuItemCountBefore = viewModel.selectedMenuItemList.filter({$0.isSelected}).count
        viewModel.changeSelectedMenuItemList(MenuCategory.food.rawValue)
        let selectedMenuItemCountAfter = viewModel.selectedMenuItemList.filter({$0.isSelected}).count
        XCTAssertEqual(selectedMenuItemCountBefore+1, selectedMenuItemCountAfter)
    }
    
    func testsortedMenuItemList() throws {
        DataStorage.shared.removeAll()
        viewModel.reloadAll()
        let selectedMenuItemCountBefore = viewModel.sortedMenuItemList.filter({$0.isSelected}).count
        viewModel.changeSortedMenuItemList(SortedMenuItem.price.rawValue)
        let selectedMenuItemCountAfter = viewModel.sortedMenuItemList.filter({$0.isSelected}).count
        XCTAssertEqual(selectedMenuItemCountBefore+1, selectedMenuItemCountAfter)
    }
}
