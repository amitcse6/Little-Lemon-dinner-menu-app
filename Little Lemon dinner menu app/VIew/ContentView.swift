//
//  ContentView.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                MenuItemsView()
            }
            .navigationTitle("Little Lemon")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
