# FoodRecipe
FoodRecipeBook 

     //
//  ViewController.swift
//  MaxxSchwelz
//
//  Created by Admin on 28/12/24.
//



import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tblList: UITableView!
    
    var arrProduct: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequest()
        
    }
    func getRequest() {
        // request url
        let url = URL(string: "https://fakestoreapi.com/products")!
        // change the url
        // create URLSession with default configuration
        let session = URLSession.shared                // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: url) { [self] data, response, error in                        if let error = error {
            print("GET Request Error: \(error.localizedDescription)")
            return
        }
        // ensure there is valid response code returned from this HTTP response
        guard let httpResponse = response as? HTTPURLResponse,                  (200...299).contains(httpResponse.statusCode) else {                      print("Invalid Response received from the server")
            return
            
        }
        // ensure there is data returned
        guard let responseData = data else {
            print("nil Data received from the server")
            return
            
        }
        do {
            if let picture = try JSONDecoder().decode([Product].self, from: data!) as? [Product] {
                arrProduct = picture
                print("CoUNT Data",arrProduct.first?.title)
                
                DispatchQueue.main.async {
                  // your code here
                    setUI()
                    tblList.reloadData()
                }
                
                
            } else {
                print("data maybe corrupted or in wrong format")
                
            }
            
        } catch {
            print("JSON Parsing Error: \(error.localizedDescription)")
            // print error here.
            
        }
        
        }
        // resume the task
        task.resume()
        
    }
        
    }
        
extension ViewController {
    func setUI() {
        tblList.delegate = self
        tblList.dataSource = self
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblList.dequeueReusableCell(withIdentifier: "cell") as! ListViewCell
        cell.lblName.text = arrProduct[indexPath.row].title
        return cell
    }
    
}
        // MARK: - WelcomeElement
        struct Product: Codable {
            let id: Int
            let title: String
            let price: Double
            let description: String
            let category: Category
            let image: String
            let rating: Rating
            
        }
        enum Category: String, Codable {
            case electronics = "electronics"
            case jewelery = "jewelery"
            case menSClothing = "men's clothing"
            case womenSClothing = "women's clothing"
            
        }
// MARK: - Rating
        struct Rating: Codable {
            let rate: Double
            let count: Int
            
        }
        
