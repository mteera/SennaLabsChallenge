//
//  User.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import Foundation

typealias JSON = [String:Any]

struct Restaurant {
    
    var id: Int
    var image: String?
    var kind: String
    var name: String

    
    
    init(data: JSON) {
        self.id = data["id"] as! Int
        self.image = data["image_url"] as? String
        self.kind = data["kind"] as! String
        self.name = data["name"] as! String

    }
}
