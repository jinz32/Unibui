//
//  JobDetailViewModel.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import Foundation

@MainActor
class JobDetailViewModel: ObservableObject {
    var job: Job
    
    private var favoriteStore: FavoritesStore
    
    init(job: Job, favoriteStore: FavoritesStore) {
        self.job = job
        self.favoriteStore = favoriteStore
    }
    
    func isFavorite(job: Job) -> Bool {
        favoriteStore.isFavorite(job: job)
    }
    
    func toggleFavorite() {
        favoriteStore.toggleFavorite(job: job)      
    }
}
