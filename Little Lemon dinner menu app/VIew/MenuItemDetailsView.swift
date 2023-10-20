//
//  MenuItemDetailsView.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    var item: MenuItem
    
    var body: some View {
        VStack {
            Text("\(item.title)")
                .font(.title)
            Image("Little Lemon logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 400)
            Spacer()
            Text("Price:")
                .font(.system(size: 20))
            Text("\(item.price)")
                .font(.system(size: 12))
            Text("Ordered:")
                .font(.system(size: 20))
            Text("\(1000)")
                .font(.system(size: 12))
            Text("Ingredients:")
                .font(.system(size: 20))
            Text("\(item.ingredients.map({$0.rawValue}).joined(separator: "\n"))")
                .font(.system(size: 12))
            Spacer()
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView(item: MenuItem(price: 10, title: "Dessert 1", category: .dessert, orderCount: 0, ingredients: [], icon: "", isMostPopular: false))
    }
}
