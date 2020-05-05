//
//  Breed.swift
//  Doggify
//
//  Created by Ludo van Orden on 25/04/2020.
//  Copyright © 2020 Ludo van Orden. All rights reserved.
//

import Foundation
import SwiftyJSON


class Breed {
    var id: Int
    var name: String
    var breedGroup: Int
    var description: String?
    var imageUrl: URL?
    
    init(from json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        
        self.breedGroup = json["breed_group"].intValue
        
        if json["description"].exists() {
            self.description = json["description"].stringValue
        } else {
            self.description = nil
        }
        
        if json["image_url"].exists() {
            self.imageUrl = json["image_url"].url
        } else {
            self.imageUrl = nil
        }
        
    }
    
}
