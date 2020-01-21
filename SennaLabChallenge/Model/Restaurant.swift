//
//  User.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import Foundation

// Using typealias better readability
typealias JSON = [String:Any]

// Sructs over Class as it is a simple data type and does not require any inheriting.

struct Restaurant {
    
    var id: Int
    var image: String?
    var kind: String
    var name: String
    var menus: [Menu]?
    
    
    init(data: JSON) {
        self.id = data["id"] as! Int
        self.image = data["image_url"] as? String
        self.kind = data["kind"] as! String
        self.name = data["name"] as! String
        
        
        // As the object is reusedwe need to chec if the menu data exists before casting it to the object.
        guard let menus = data["menus"] as? [JSON] else { return }
        var array: [Menu] = []

        menus.forEach { (menu) in
            let menu = Menu(data: menu)
            array.append(menu)

        }

        self.menus = array
        
    }
}
