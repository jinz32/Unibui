//
//  JobListView.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import Foundation
import SwiftUI

struct JobListView: View {
    @State private var startAnimation: Bool = false
    @State private var showFavoritesOnly: Bool = false
    @State private var selectedTab: Int = 0
    @ObservedObject var viewModel: JobListViewModel
    @State private var path: [Job] = []
    
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                segmentedControl
                content()
            }
            .navigationTitle("Jobs")
            .task {
                viewModel.fetchJobList()
            }
            .onAppear {
                setOrangeNavigationBar()
                customizeSearchBar()
                withAnimation(.easeInOut(duration: 0.75).delay(0.5)) {
                    startAnimation = true
                }
            }
            .onDisappear {
                startAnimation = false
            }
            .opacity(startAnimation ? 1.0 : 0.0)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: viewModel.searchText) { _ in
                viewModel.filterJobs()
            }
            .navigationDestination(for: Job.self) { job in
                DetailJobView(
                    viewModel: JobDetailViewModel(job: job, favoriteStore: viewModel.favoriteStore)
                )
            }
            .background(Color.primary.ignoresSafeArea().opacity(1))
            .accentColor(.orange)
        }
    }
    
    private var segmentedControl: some View {
        let pickerItems = [
            UBPickerItemView(title: "All Jobs", tag: 0),
            UBPickerItemView(title: "Favorites", tag: 1)
        ]
        return UBSegmentedPicker(
            selectedTab: $selectedTab,
            items: pickerItems
        )
    }
    
    private var jobsToDisplay: [Job] {
        switch selectedTab {
        case 0:
            return viewModel.searchText.isEmpty ? viewModel.jobs : viewModel.filteredJobs
        case 1:
            return Array(viewModel.favoriteStore.favoriteJobs)
        default:
            return []
        }
    }
    
    private func content() -> some View {
        Group {
            if viewModel.isLoading {
                loading()
                Spacer()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                Spacer()
            } else if jobsToDisplay.isEmpty {
                Text("List is empty")
                    .foregroundColor(.white)
                Spacer()
            } else {
                jobsView()
            }
        }
    }
    
    private func loading() -> some View {
        ProgressView("Loading Jobs..")
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5, anchor: .center)
    }
    
    private func jobsView() -> some View {
        List(jobsToDisplay, id: \.self) { job in
            UBListItemView(
                primaryDetail: job.jobTitle,
                secondaryDetail: job.companyName,
                tertiaryDetail: "Location: \(job.location)",
                mode: .list,
                action: {
                    path.append(job)
                }
            )
            .listRowBackground(Color.clear)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .listStyle(PlainListStyle())
    }
    
    private func setOrangeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let black = UIColor.darkGray.withAlphaComponent(0.1)
        appearance.backgroundColor = black
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func customizeSearchBar() {
        UISearchBar.appearance().searchBarStyle = .minimal
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            JobListView(viewModel: JobListViewModel(favoriteStore: FavoritesStore()))
                .accentColor(.orange)
        }
    }
}
