//
//  CategoryButtonsViewModel.swift
//  news
//
//  Created by Nariman on 26.12.2023.
//

import Foundation

final class CategoryButtonsViewModel: ObservableObject {
    private let networkService: NetworkService = .init()
    @Published var initialNews: [Article] = []
    
    func getInitialNews() {
        networkService.fetchNewsBy(category: <#T##String#>, completion: <#T##(Result<NewsModel, NetworkError>) -> Void#>)
    }
}
