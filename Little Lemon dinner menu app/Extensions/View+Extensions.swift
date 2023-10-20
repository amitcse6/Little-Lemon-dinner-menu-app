//
//  View+Extensions.swift
//  Little Lemon dinner menu app
//
//  Created by 11461_amit on 20/10/23.
//

import Foundation
import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
