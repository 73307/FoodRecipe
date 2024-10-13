//
//  DashboardVC.swift
//  Food_Recipe_App
//
//  Created by Admin on 03/12/23.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodDiscription : UILabel!
    @IBOutlet weak var lblTitleName: UILabel!
    @IBOutlet weak var imgOfFood: UIImageView!
    @IBOutlet weak var btnGoHome: UIButton!

    
    var foodName = ""
    var titleName = ""
    var foodDiscription = ""
    var imgName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitleName.text = titleName
//        let imageTitleName = titleName
        self.imgOfFood.image = UIImage(named: imgName)
        btnGoHome.layer.cornerRadius = 8
        lblFoodName.text = foodName
        lblFoodDiscription.text = foodDiscription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imgOfFood.image = UIImage(named: imgName)
    }
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @available(iOS 13.0, *)
    @IBAction func btnGoHome(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "AboutAppVC") as! AboutAppVC
        navigationController?.pushViewController(vc, animated: true)
    }


}
