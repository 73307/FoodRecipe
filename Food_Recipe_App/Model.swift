//
//  Model.swift
//  Food_Recipe_App
//
//  Created by Admin on 03/12/23.
//

import Foundation

class ListOfFoodModel {
    
    var foodTitle: String
    var arrDataList: [FoodNameModel]
    
    init(foodTitle: String, arrDataList:[FoodNameModel]) {
        self.foodTitle = foodTitle
        self.arrDataList = arrDataList
        
    }
}
class FoodNameModel {
    var foodName: String
    var foodDiscreption: String
    
    init( foodName: String,foodDiscreption: String) {
        self.foodName = foodName
        self.foodDiscreption = foodDiscreption
    }
}

class FoodDiscreption {
    
    init( foodDiscreption: String) {
        
    }
}
