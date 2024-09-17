//
//  JobListViewModel.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import Foundation

@MainActor
class JobListViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var filteredJobs: [Job] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var favoriteStore: FavoritesStore
    
    init(favoriteStore: FavoritesStore) {
        self.favoriteStore = favoriteStore
    }
    
    var searchText: String = "" {
        didSet {
            filterJobs()
        }
    }
    
    private let service = CsvService()

    func fetchJobList() {
        isLoading = true
        Task {
            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000) // added artificial loading state to test progressiveview
            if let fetchedJobs = await service.parseCsvData() {
                jobs = fetchedJobs
            } else {
                errorMessage = "Error reading file"
            }
            isLoading = false
        }
    }
    
    func filterJobs() {
        if searchText.isEmpty {
            filteredJobs = jobs
        } else {
            filteredJobs = jobs.filter { job in
                job.jobTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func isFavorite(job: Job) -> Bool {
        favoriteStore.isFavorite(job: job)
    }
}
