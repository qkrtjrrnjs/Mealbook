//
//  MealViewModel.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation

class MealViewModel {
    var apiService: APIServiceProtocol
    var categoryName: String
    var meals: Observable<[Meal]> = Observable([])
    let errorMessage: Observable<String> = Observable("")
    
    init(apiService: APIServiceProtocol, categoryName: String) {
        self.apiService = apiService
        self.categoryName = categoryName
    }
    
    func fetchData() {
        Task {
            do {
                let result: Meals = try await apiService.fetchData(for: .meal, with: categoryName)
                self.meals.value = result.meals.sorted { $0.name < $1.name }
            } catch {
                self.errorMessage.value = error.localizedDescription
            }
        }
    }
}
