//
//  FoodListCell.swift
//  Food_Recipe_App
//
//  Created by Admin on 03/12/23.
//

import UIKit

class FoodListCell: UITableViewCell {
    
    @IBOutlet weak var lblFoodName:UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
