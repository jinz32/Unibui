//
//  JobDetailView.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import Foundation
import SwiftUI

struct DetailJobView: View {
    @ObservedObject var viewModel: JobDetailViewModel
    @State private var startAnimation: Bool = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    UBListItemView(primaryDetail: "Company", 
                                   secondaryDetail: viewModel.job.companyName,
                                   mode: .detail)
                                   
                    UBFavoriteButtonView(isFavorite: viewModel.isFavorite(job: viewModel.job)) {
                        viewModel.toggleFavorite()
                    }
                }
                UBListItemView(primaryDetail: "Location", 
                               secondaryDetail: viewModel.job.location,
                               mode: .detail)
                UBListItemView(primaryDetail: "Job Description",
                               secondaryDetail:  viewModel.job.jobDescription,
                               mode: .detail)
                UBListItemView(primaryDetail: "Requirements", secondaryDetail: viewModel.job.requirements,
                               mode:.detail)
                Spacer()
            }
            .foregroundColor(.white)
            .navigationTitle(viewModel.job.jobTitle)
            .padding()
            .opacity(startAnimation ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.75).delay(0.5), value: startAnimation)
            .onAppear {
                startAnimation = true
            }
        }
        .background(Color.primary.ignoresSafeArea().opacity(1))
    }
}

