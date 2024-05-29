import Foundation
struct DessertDetailModel: Codable {
    let meals: [RecipeModel]
}

struct RecipeModel: Codable {
    let strMeal: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strYoutube: String?
    let strSource: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?

}

extension RecipeModel {
    var arrIngredients: [Ingredient] {
        var arrIngredients = [Ingredient]()
        if let ingr = self.strIngredient1, ingr.isEmpty == false, let measure = self.strMeasure1 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient2, ingr.isEmpty == false, let measure = self.strMeasure2 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient3, ingr.isEmpty == false, let measure = self.strMeasure3 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient4, ingr.isEmpty == false, let measure = self.strMeasure4 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient5, ingr.isEmpty == false, let measure = self.strMeasure5 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient6, ingr.isEmpty == false, let measure = self.strMeasure6 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient7, ingr.isEmpty == false, let measure = self.strMeasure7 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient8, ingr.isEmpty == false, let measure = self.strMeasure8 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient9, ingr.isEmpty == false, let measure = self.strMeasure9 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient10, ingr.isEmpty == false, let measure = self.strMeasure10 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient11, ingr.isEmpty == false, let measure = self.strMeasure11 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient12, ingr.isEmpty == false, let measure = self.strMeasure12 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient13, ingr.isEmpty == false, let measure = self.strMeasure13 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient14, ingr.isEmpty == false, let measure = self.strMeasure14 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient15, ingr.isEmpty == false, let measure = self.strMeasure15 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient16, ingr.isEmpty == false, let measure = self.strMeasure16 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient17, ingr.isEmpty == false, let measure = self.strMeasure17 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient18, ingr.isEmpty == false, let measure = self.strMeasure18 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient19, ingr.isEmpty == false, let measure = self.strMeasure19 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        if let ingr = self.strIngredient20, ingr.isEmpty == false, let measure = self.strMeasure20 {
            arrIngredients.append(Ingredient(name: ingr, measurement: measure))
        }
        return arrIngredients
    }
}
