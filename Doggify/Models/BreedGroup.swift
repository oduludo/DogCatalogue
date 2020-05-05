//
//  BreedGroup.swift
//  Doggify
//
//  Created by Ludo van Orden on 25/04/2020.
//  Copyright © 2020 Ludo van Orden. All rights reserved.
//

import Foundation
import SwiftyJSON


class BreedGroup {
    var id: Int
    var name: String
    var description: String?
    var breeds: [Int] = [Int]()
    
    init(from json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        
        if json["description"].exists() {
            self.description = json["description"].stringValue
        } else {
            self.description = nil
        }
        
        if json["breeds_ids"].exists() {
            for breed in json["breeds_ids"].arrayValue {
                self.breeds.append(breed["id"].intValue)
            }
        }
    }
    
    init(id: Int, name: String, description: String?, breeds: [Int]) {
        self.id = id
        self.name = name
        self.description = description
        self.breeds = breeds
    }
    
    convenience init(with id: Int, name: String) {
        self.init(id: id, name: name, description: nil, breeds: [Int]())
    }
    
    func testBreedGroup() -> Void {
        print("This is a breed group. Its name is: \(self.name), the ID from the database is: \(self.id).")
        
        if let desc = self.description {
            print(desc)
        }
        
        if self.breeds.count > 0 {
            print("This breed group consists of the following breed-IDs:")
            for breedId in self.breeds {
                print("- \(breedId)")
            }
        } else {
            print("No breeds have been assigned to this breed group yet!")
        }
        
    }
    
}
