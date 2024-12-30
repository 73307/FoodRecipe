# FoodRecipe
FoodRecipeBook 

      // Define the URL for the login endpoint
            guard let url = URL(string: "https://stageryve-api.azurewebsites.net/login") else { return }

            // Create the request
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            // Prepare the JSON body
            let json: [String: Any] = ["login": username, "password": password]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)

            request.httpBody = jsonData

            // Create the URLSession data task
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                guard let data = data else { return }
                
                // Handle the response
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("Response: \(jsonResponse)")
                        // Handle successful login, e.g. save token
                    }
                } catch {
                    print("Error parsing response: \(error)")
                }
            }
            
            // Start the task
            task.resume()
