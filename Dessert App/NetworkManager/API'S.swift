

import Foundation

struct APIs{
    private static let baseURL  = "https://themealdb.com/api/json/v1/1"
    static let dessertURL       = baseURL + "/filter.php?c=Dessert"
    static let mealDetails      = baseURL + "/lookup.php?i="
}
