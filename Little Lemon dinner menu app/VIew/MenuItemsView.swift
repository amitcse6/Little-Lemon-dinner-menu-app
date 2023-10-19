//
//  MenuItemsView.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import SwiftUI

struct MenuItemsView: View {
    @ObservedObject var viewModel = MenuViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(viewModel.menuItemList) { menu in
                    HStack {
                        Text(menu.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("5555")
                            Text("6666")
                        }
                    }
                    .frame(height: 80)
                    .padding(12)
                }
            }
        }
        .onAppear(perform: {
            viewModel.fetchMenuItemList()
        })
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
