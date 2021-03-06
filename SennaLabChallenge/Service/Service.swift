//
//  Service.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import Foundation

class Service {

    // Parsing json from the url and casting into an object.
    static let shared = Service()

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
                        restaurants.append(restaurant)
                    }
                    completion(restaurants, nil)
                  } catch {
                      completion(nil, error)
                  }
               }

           }.resume()
        }

    }
    
    
    func getRestaurantBy(id: Int, completion: @escaping (Restaurant?,
    Error?)-> Void) {
        if let url = URL(string: "https://order-plz.herokuapp.com/restaurants/\(id).json") {
                    URLSession.shared.dataTask(with: url) { data, response, error in
               if let data = data {
                   do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return }
                    let restaurant = Restaurant(data: json)
                    completion(restaurant, nil)

                   } catch {

                       completion(nil, error)

                   }

                }

            }.resume()
         }
    }

}

