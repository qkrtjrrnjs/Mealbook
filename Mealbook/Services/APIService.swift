//
//  APIService.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation

enum APIError: Error {
    case invalidURL
}

enum ServiceURL: String {
    case category = "https://www.themealdb.com/api/json/v1/1/categories.php"
    case meal = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    case recipe = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
}

protocol APIServiceProtocol {
    func fetchData<T: Decodable>(for serviceURL: ServiceURL, with param: String) async throws -> T
}

class APIService: APIServiceProtocol {
    
    func fetchData<T: Decodable>(for serviceURL: ServiceURL, with param: String) async throws -> T {
        guard let url = URL(string: serviceURL.rawValue + param) else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let results = try JSONDecoder().decode(T.self, from: data)

        return results
    }
    
}
