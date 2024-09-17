//
//  UBFavoriteButton.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/16/24.
//
import SwiftUI
import Foundation

struct UBFavoriteButtonView: View {
    let isFavorite: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isFavorite ? "star.fill" : "star")
                Text(isFavorite ? "Unfavorite" : "Add to Favorites")
            }
            .padding()
            .background(Color.orange.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
