//
//  UBPickerItem.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/16/24.
//

import SwiftUI

struct UBPickerItemView: Identifiable {
    let id: UUID = UUID()
    let title: String
    let tag: Int
}

struct UBSegmentedPicker: View {
    @Binding var selectedTab: Int
    let items: [UBPickerItemView]
    
    var body: some View {
        Picker("Select View", selection: $selectedTab) {
            ForEach(items) { item in
                Text(item.title).tag(item.tag)
            }
        }
        .background(Color.orange.opacity(1.0))
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
