//
//  InitialNewsViewModel.swift
//  news
//
//  Created by Nariman on 25.12.2023.
//

import SwiftUI

final class InitialNewsViewModel: ObservableObject {
    private let networkService: NetworkService = .init()
    @Published var initialNews: [Article] = []
    
    func getInitialNews() {
        networkService.fetchInitialNews(county: .us) { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.initialNews = model.articles
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func processDate(from dateString: String) -> String {
        var str: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        if let date = dateFormatter.date(from: dateString) {
            let shortDateFormatter = DateFormatter()
            shortDateFormatter.dateFormat = "MM.dd"

            str = shortDateFormatter.string(from: date)
        } else {
            print("Ошибка при преобразовании строки в дату")
        }
        
        return str
    }
}
