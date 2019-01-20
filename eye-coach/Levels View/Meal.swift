//
//  Meal.swift
//  FoodTracker
//
//  Created by Mario Ban on 24.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

//import Foundation
import UIKit

class Meal: NSObject, /* protocol */ NSCoding {

  // MARK: Properties

  var name: String
  var photo: UIImage?

  // MARK: Archiving Paths

  static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
  static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")

  // MARK: Types

  struct PropertyKey {
    static let nameKey = "name"
    static let photoKey = "photo"
  }

  // MARK: Initialization

  init?(name: String, photo: UIImage?) {
    // Initialize stored properties.
    self.name = name
    self.photo = photo

    super.init() // Call superclass initializer

    // Initialization should fail if there is no name or if the rating is out of range.
    if name.isEmpty {
      return nil
    }
  }

  // MARK: NSCoding

  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: PropertyKey.nameKey)
    aCoder.encode(photo, forKey: PropertyKey.photoKey)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
    // Because photo is an optional property of Meal, use conditional cast.
    let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage

    // Must call designated initializer.
    self.init(name: name, photo: photo)
  }

}
