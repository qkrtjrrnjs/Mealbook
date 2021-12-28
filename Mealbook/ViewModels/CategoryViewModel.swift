//
//  CategoryViewModel.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation

class CategoryViewModel {
    private(set) var apiService: APIServiceProtocol
    let categories: Observable<[Category]> = Observable([])
    let errorMessage: Observable<String> = Observable("")
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchData() {
        Task {
            do {
                let result: Categories = try await apiService.fetchData(for: .category, with: "")
                self.categories.value = result.categories.sorted { $0.name < $1.name }
            } catch {
                self.errorMessage.value = error.localizedDescription
            }
        }
    }
}
