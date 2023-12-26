//
//  CategoryButtons.swift
//  news
//
//  Created by Nariman on 26.12.2023.
//

import SwiftUI

struct CategoryButtons: View {
    
    var categories: [String] = [
        "business",
        "entertainment",
        "general",
        "health",
        "science",
        "sports",
        "technology"
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button {
                        print(category)
                    } label: {
                        Text(category)
                            .foregroundStyle(.black)
                            .padding(4)
                    }
                    .padding(4)
                    .background(Color.gray2)
                    .cornerRadius(8)
                }
            }
            .padding(.init(top: 0, leading: 14, bottom: 0, trailing: 0))
        }
        .scrollIndicators(.hidden)
    }
}
