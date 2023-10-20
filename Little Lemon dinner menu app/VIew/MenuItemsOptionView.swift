//
//  MenuItemsOptionView.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = MenuViewModel()
    
    var body: some View {
        ZStack {
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    ForEach(viewModel.selectedMenuItemList) { item in
                        TaskRow(item.title.uppercased(), item.isSelected)
                        .onTapGesture {
                            viewModel.changeSelectedMenuItemList(item.title)
                        }
                    }
                }
                
                Section(header: Text("SORT BY")) {
                    ForEach(viewModel.sortedMenuItemList) { item in
                        TaskRow(item.title.uppercased(), item.isSelected)
                            .onTapGesture {
                                viewModel.changeSortedMenuItemList(item.title)
                            }
                    }
                }
            }
            closeButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
        .onAppear(perform: {
            viewModel.reloadAll()
        })
    }
    
    func TaskRow(_ title: String, _ isSelected: Bool) -> some View {
        return HStack {
            Text(title)
            Spacer()
            Text(isSelected ? "Selected" : "x")
        }
        .frame(maxWidth: .infinity)
    }
    
    var closeButton: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                        .padding(10)
                }
            }
            .padding(.top, 5)
            Spacer()
        }
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
    }
}
