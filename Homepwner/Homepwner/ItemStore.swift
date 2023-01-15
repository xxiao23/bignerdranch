//
//  ItemStore.swift
//  Homepwner
//
//  Created by Xiang Xiao on 1/4/23.
//

import UIKit

class ItemStore {
    
  var allItems = [Item]()
  let itemArchiveURL: URL = {
    let documentDirectories =
      FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = documentDirectories.first!
    return documentDirectory.appendingPathComponent("items.archive")
  }()
  
  init() {
    if let archivedItems =
        NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
      allItems = archivedItems
    }
  }
  
  @discardableResult func createItem() -> Item {
    let newItem = Item(random: true)
    
    allItems.append(newItem)
    
    return newItem
  }

  func removeItem(_ item: Item) {
    if let index = allItems.firstIndex(of: item) {
      allItems.remove(at: index)
    }
  }
  
  func moveItem(from fromIndex: Int, to toIndex: Int) {
    if fromIndex == toIndex {
      return
    }
    
    // Get reference to object being moved so you can reinsert it
    let moveItem = allItems[fromIndex]
    
    // Remove item from array
    allItems.remove(at: fromIndex)
    
    // Insert item in array at new location
    allItems.insert(moveItem, at: toIndex)
  }
  
  // MARK: - Achiving items
  func saveChanges() -> Bool {
    print("Saving items to \(itemArchiveURL.path)")
    return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
  }
}
