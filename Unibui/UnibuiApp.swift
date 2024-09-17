//
//  UnibuiApp.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import SwiftUI

@main
struct UnibuiApp: App {
    @StateObject private var favoritesStore = FavoritesStore()
    
    var body: some Scene {
        WindowGroup {
            JobListView(viewModel: JobListViewModel(favoriteStore: favoritesStore))
        }
    }
}
