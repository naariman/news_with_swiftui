//
//  NewsModel.swift
//  job_search
//
//  Created by Nariman on 24.12.2023.
//

import Foundation
import SwiftData

struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Hashable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}
