//
//  Service.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import Foundation

class Service {

    static let shared = Service()
    
    var usersSince = 0
    var perPage = 20


    func getRestaurants(completion: @escaping ([Restaurant]?,
        Error?)-> Void) {

        if let url = URL(string: "https://order-plz.herokuapp.com/restaurants.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in

              if let data = data {
                
                  do {

                      guard let jsonString = try JSONSerialization.jsonObject(with: data, options: []) as? JSON, let jsonArray = jsonString["restaurants"] as? [JSON] else { return }
                      
                    
                    var restaurants: [Restaurant] = []
                    
                    jsonArray.forEach { (json) in
                        let restaurant = Restaurant(data: json)
                        
                        print(restaurant)
                        restaurants.append(restaurant)
                    }
                    

                    
                    completion(restaurants, nil)
    

                      
                  } catch {
                    
                      completion(nil, nil)

                      
                  }

               }
            
            
            completion(nil, nil )

           }.resume()
        }

    }
    
}

