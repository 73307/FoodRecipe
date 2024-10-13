//
//  AboutAppVC.swift
//  Food_Recipe_App
//
//  Created by Admin on 04/12/23.
//

import UIKit

class AboutAppVC: UIViewController {
    
    @IBOutlet weak var btnGoHome: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnGoHome.layer.cornerRadius = 8
    }
    
    @available(iOS 13.0, *)
    @IBAction func btnGoHome(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
  
}
