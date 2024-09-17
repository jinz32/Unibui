//
//  UBSearchBar.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/16/24.
//

import SwiftUI


struct UBSearchBarView: View {
    @Binding var searchText: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $searchText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .background(Color.white.opacity(0.9))
            .cornerRadius(8)
            .padding([.leading, .trailing])
    }
}
