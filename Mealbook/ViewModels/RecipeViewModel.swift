//
//  RecipeViewModel.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation

class RecipeViewModel {
    var apiService: APIServiceProtocol
    var mealId: String
    var recipes: Observable<[Recipe]> = Observable([])
    let errorMessage: Observable<String> = Observable("")
    
    init(apiService: APIServiceProtocol, mealId: String) {
        self.apiService = apiService
        self.mealId = mealId
    }
    
    func fetchData() {
        Task {
            do {
                let result: Recipes = try await apiService.fetchData(for: .recipe, with: mealId)
                self.recipes.value = result.meals
            } catch {
                self.errorMessage.value = error.localizedDescription
            }
        }
    }
}
