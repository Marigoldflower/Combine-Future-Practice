//
//  Model.swift
//  Combine_Future_Practice
//
//  Created by 황홍필 on 2023/05/24.
//

import Foundation

// MARK: - TeslaModel
struct TeslaModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
}

// MARK: - Source
struct Source: Codable {
    let name: String
}
