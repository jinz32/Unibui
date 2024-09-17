//
//  UBListItem.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/16/24.
//

import SwiftUI

enum UBListItemMode {
    case list
    case detail
}

struct UBListItemView: View {
    let primaryDetail: String
    let secondaryDetail: String
    let tertiaryDetail: String?
    let mode: UBListItemMode
    let action: () -> Void
    
    
    init(primaryDetail: String, secondaryDetail: String, tertiaryDetail: String? = nil,mode: UBListItemMode = .list, action: @escaping () -> Void = {}) {
        self.primaryDetail = primaryDetail
        self.secondaryDetail = secondaryDetail
        self.tertiaryDetail = tertiaryDetail
        self.mode = mode
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(primaryDetail)
                .font(.headline)
                .foregroundColor(.white)
            Text("Company: \(secondaryDetail)")
                .foregroundColor(.white)
            if let tertiaryDetail = tertiaryDetail {
                Text(tertiaryDetail)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(backgroundColor)
        .ignoresSafeArea(.all)
        .cornerRadius(8)
        .onTapGesture {
            action()
        }
    }
    private var backgroundColor: some View {
        if mode == .list {
            Color.secondary
        } else {
            Color.clear
        }
    }
}

struct UBListItem_Previews: PreviewProvider {
    static var previews: some View {
        UBListItemView(
            primaryDetail: "Software Engineer",
            secondaryDetail: "Tech Corp",
            tertiaryDetail: "San Francisco, CA"
        ) {
            print("Job tapped!")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
