//
//  Meal.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation

struct Meals: Decodable {    
    var meals: [Meal]
}

struct Meal: Decodable {
    var name: String
    var thumbnail: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}
