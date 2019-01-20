//
//  fPerson.swift
//  eye-coach
//
//  Created by Gautom Das on 1/19/19.
//  Copyright © 2019 GDAKPZ. All rights reserved.
//

import Foundation
import UIKit


class fPerson {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        
    }
}
