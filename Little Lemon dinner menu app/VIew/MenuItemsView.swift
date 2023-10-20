//
//  MenuItemsView.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import SwiftUI

struct MenuItemsView: View {
    @ObservedObject var viewModel = MenuViewModel()
    @State private var showSheet = false
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ZStack {
            if viewModel.isAnyItemAvailable() {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, spacing: 8, pinnedViews: [.sectionHeaders]) {
                        ForEach(Array(viewModel.menuItemList.keys), id: \.self) { key in
                            if viewModel.getMenuItemListBy(category: key).count > 0 {
                                Section(header: headerView(category: key)) {
                                    ForEach(viewModel.getMenuItemListBy(category: key)) { menu in
                                        HStack {
                                            VStack {
                                                Text("Price: \(menu.price)\nPopularity: \(menu.isMostPopular ? "Most" : "Less")")
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                    .font(.system(size: 12))
                                                    .foregroundColor(.white)
                                                    .background(Color.black)
                                                
                                                Text("\(menu.title)")
                                                    .frame(maxWidth: .infinity, minHeight: 20)
                                                    .font(.system(size: 14))
                                                    .background(Color.purple)
                                            }
                                        }
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .background(Color.gray)
                                        .cornerRadius(8)
                                    }
                                }
                            }
                        }
                    }
                }
            }else {
                HStack {
                    Text("Item not found!!")
                        .font(.title)
                        .italic()
                }
            }
        }
        .padding(8)
        .navigationBarTitle(Text("Menu"), displayMode: .inline)
        .navigationBarItems(trailing: HStack {
            Button(action: {
                showSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 21))
            }
            .sheet(isPresented: $showSheet, onDismiss: {
                viewModel.reloadAll()
            }) {
                MenuItemsOptionView()
            }
        })
        .onAppear(perform: {
            viewModel.reloadAll()
        })
        
    }
    
    func headerView(category: MenuCategory) -> some View{
        return HStack {
            Spacer()
            Text("\(category.rawValue.uppercased())")
            Spacer()
        }
        .padding(8)
        .cornerRadius(8)
        .background(Color.gray)
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
