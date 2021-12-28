//
//  Category.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation

struct Categories: Decodable {
    var categories: [Category]
}

struct Category: Decodable {
    var id: String
    var name: String
    var thumbnail: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
