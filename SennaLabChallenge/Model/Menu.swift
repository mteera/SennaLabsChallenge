//
//  Menu.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 21/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import Foundation


// Sructs over Class as it is a simple data type and does not require any inheriting.
struct Menu {
    
    var id: Int
    var restaurantId: Int
    var name: String
    var imageUrl: String
    var price: String
    var deliverTime: Int
    
    init(data: JSON) {
        self.id = data["id"] as! Int
        self.restaurantId = data["restaurant_id"] as! Int
        self.name = data["name"] as! String
        self.imageUrl = data["image_url"] as! String
        self.price = data["price"] as! String
        self.deliverTime = data["deliver_time"] as! Int
    }
    
}
