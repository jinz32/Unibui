//
//  FavoriteStore.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import Foundation

class FavoritesStore: ObservableObject {
    @Published var favoriteJobs: Set<Job> = []
    
    func toggleFavorite(job: Job) {
        if favoriteJobs.contains(job) {
            favoriteJobs.remove(job)
        } else {
            favoriteJobs.insert(job)
        }
    }
    
    func isFavorite(job: Job) -> Bool {
        favoriteJobs.contains(job)
    }
}
