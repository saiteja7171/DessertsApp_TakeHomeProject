

import Foundation

struct DessertModel: Codable {
    let meals: [Meals]
}

struct Meals: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
