

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getRequest()
        
    }


}
extension ViewController {
    func getRequest() {
        
        let url = URL(string: "https://fakestoreapi.com/products")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [self] data, response, error in                        if let error = error {
            print("GET Request Error: \(error.localizedDescription)")
            return
        }
            guard let httpResponse = response as? HTTPURLResponse,                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid Response received from the server")
                return
                
            }
            guard let responseData = data else {
                print("nil Data received from the server")
                return
                
            }
            do {
                if let picture = try JSONDecoder().decode([Product].self, from: data!) as? [Product] {
                    //                arrProduct = picture
                    print("CoUNT Data",picture.first?.title)
                    
                    //                DispatchQueue.main.async {
                    //                  // your code here
                    //                    setUI()
                    //                    tblList.reloadData()
                    //                }
                    
                    
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
}
