//
//  ViewController.swift
//  Food_Recipe_App
//
//  Created by Admin on 02/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOne.layer.cornerRadius = 10
        viewTwo.layer.cornerRadius = 10
        viewThree.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @available(iOS 13.0, *)
    @IBAction func btnNext(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "ViewControllerTwo") as! ViewControllerTwo
        navigationController?.pushViewController(vc, animated: true)
    }
}

class ViewControllerTwo: UIViewController {
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOne.layer.cornerRadius = 10
        viewTwo.layer.cornerRadius = 10
        viewThree.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    @available(iOS 13.0, *)
    @IBAction func btnNext(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "ViewControllerThree") as! ViewControllerThree
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
class ViewControllerThree: UIViewController {
    
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOne.layer.cornerRadius = 10
        viewTwo.layer.cornerRadius = 10
        viewThree.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @available(iOS 13.0, *)
    @IBAction func btnNext(_ sender: UIButton) {
        print("Please GO back")
        let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
