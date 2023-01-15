//
//  Item.swift
//  Homepwner
//
//  Created by Xiang Xiao on 1/4/23.
//

import UIKit

class Item: NSObject, NSCoding {
  var name: String
  var valueInDollars: Int
  var serialNumber: String?
  let dateCreated: Date
  let itemKey: String
  
  init(name: String, serialNumber: String?, valueInDollars: Int) {
    self.name = name
    self.valueInDollars = valueInDollars
    self.serialNumber = serialNumber
    self.dateCreated = Date()
    self.itemKey = UUID().uuidString
    
    super.init()
  }
  
  convenience init(random: Bool = false) {
    if random {
      let adjectives = ["Fluffy", "Rusty", "Shiny"]
      let nouns = ["Bear", "Spork", "Mac"]
      
      var idx = arc4random_uniform(UInt32(adjectives.count))
      let randomAdjective = adjectives[Int(idx)]
      
      idx = arc4random_uniform(UInt32(nouns.count))
      let randomNoun = nouns[Int(idx)]
      
      let randomName = "\(randomAdjective) \(randomNoun)"
      let randomValue = Int(arc4random_uniform(100))
      let randomSerialNumber =
        UUID().uuidString.components(separatedBy: "-").first!
      
      self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
    } else {
      self.init(name: "", serialNumber: nil, valueInDollars: 0)
    }
  }
  
  // MARK: - NSCoding
  func encode(with coder: NSCoder) {
    coder.encode(name, forKey: "name")
    coder.encode(dateCreated, forKey: "dateCreated")
    coder.encode(itemKey, forKey: "itemKey")
    coder.encode(serialNumber, forKey: "serialNumber")
    
    coder.encode(valueInDollars, forKey: "valueInDollars")
  }
  
  required init?(coder: NSCoder) {
    name = coder.decodeObject(forKey: "name") as! String
    dateCreated = coder.decodeObject(forKey: "dateCreated") as! Date
    itemKey = coder.decodeObject(forKey: "itemKey") as! String
    serialNumber = coder.decodeObject(forKey: "serialNumber") as! String?
    
    valueInDollars = coder.decodeInteger(forKey: "valueInDollars")
    
    super.init()
  }
}
