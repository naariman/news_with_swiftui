//
//  NewsListView.swift
//  news
//
//  Created by Nariman on 25.12.2023.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel: InitialNewsViewModel
    
    let colmuns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colmuns, spacing: 12) {
                ForEach(viewModel.initialNews, id: \.title) { item in
                    ItemView(
                        title: item.title,
                        imageURLPath: item.urlToImage ?? "",
                        date: viewModel.processDate(from: item.publishedAt),
                        sourceTitle: item.source.name
                    )
                }
                .frame(width: 170, height: 200)
                .clipped()
            }
        }
    }
}
