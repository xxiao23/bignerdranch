//
//  ItemStore.swift
//  Homepwner
//
//  Created by Xiang Xiao on 1/4/23.
//

import UIKit

class ItemStore {
    
  var allItems = [Item]()
  
  @discardableResult func createItem() -> Item {
    let newItem = Item(random: true)
    
    allItems.append(newItem)
    
    return newItem
  }

  init() {
    for _ in 0..<5 {
      createItem()
    }
  }
}
