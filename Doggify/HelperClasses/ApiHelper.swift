//
//  ApiHelper.swift
//  Doggify
//
//  Created by Ludo van Orden on 25/04/2020.
//  Copyright © 2020 Ludo van Orden. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct CompleteBreedGroup {
    var breedGroup: BreedGroup
    var breeds: [Breed]
}


class ApiHelper {
    var host: String
    
    init(host: String) {
        self.host = host
    }
    
    /*
     * Get all BreedGroups
     */
    func getBreedGroups(completionHandler: @escaping ([BreedGroup]) -> Void) -> Void {
        self.performBreedGroupsRequest(completion: completionHandler)
    }
    
    private func performBreedGroupsRequest(completion: @escaping ([BreedGroup]) -> Void) -> Void {
        AF.request("\(self.host)/api/catalog/breed_groups/").response { response in
            if let responseValue = response.value {
                if let rValue = responseValue {
                    let json = JSON(rValue)
                    var breedGroups = [BreedGroup]()
                    
                    for breedGroupJSON in json["breed_groups"].arrayValue {
                        let bG = BreedGroup(from: breedGroupJSON)
                        breedGroups.append(bG)
                        print("Added a breed group")
                    }
                    
                    completion(breedGroups)
                }
            }
        }
    }
    
    
    /*
     * Get a single BreedGroup by ID
     */
    func getBreedGroup(for id: Int, completionHandler: @escaping (CompleteBreedGroup) -> Void) -> Void {
        self.performBreedGroupForIdRequest(id: id, completion: completionHandler)
    }
    
    private func performBreedGroupForIdRequest(id: Int, completion: @escaping (CompleteBreedGroup) -> Void) -> Void {
        AF.request("\(self.host)/api/catalog/breed_groups/\(id)").response { response in
            if let responseValue = response.value {
                if let rValue = responseValue {
                    let json = JSON(rValue)
                    let breedGroupJSON = json["breed_groups"].arrayValue[0]
                    
                    let breedGroup = BreedGroup(from: breedGroupJSON)
                    var breeds = [Breed]()
                    
                    for breedJSON in breedGroupJSON["breeds_ids"].arrayValue {
                        let breed = Breed(from: breedJSON)
                        breeds.append(breed)
                    }
                    
                    let completeBreedGroup = CompleteBreedGroup(breedGroup: breedGroup, breeds: breeds)
                    completion(completeBreedGroup)
                }
            }
        }
    }
    
}
