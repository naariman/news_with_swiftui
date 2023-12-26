//
//  ContentView.swift
//  job_search
//
//  Created by Nariman on 24.12.2023.
//

import SwiftUI

struct ContentView: View {
    private var viewModel = InitialNewsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                CategoryButtons()
                
                NewsListView(viewModel: viewModel)
                    .onAppear {
                        viewModel.getInitialNews()
                    }
            }
            .background(Color.mainPageBackground)
        }
        .searchable(text: $searchText)
    }
    
}


#Preview {
    ContentView()
}
