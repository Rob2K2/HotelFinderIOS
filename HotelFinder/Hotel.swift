//
//  Hotel.swift
//  HotelFinder
//
//  Created by Roberto Merino on 20/8/16.
//  Copyright © 2016 Roberto Merino. All rights reserved.
//

import UIKit

class Hotel {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    //var rating: Int
    //var id:String?
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }
    
}