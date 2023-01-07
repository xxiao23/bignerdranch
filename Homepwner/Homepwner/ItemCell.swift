//
//  ItemCell.swift
//  Homepwner
//
//  Created by Xiang Xiao on 1/6/23.
//

import UIKit

class ItemCell: UITableViewCell {
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var serialNumberLabel: UILabel!
  @IBOutlet var valueLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    nameLabel.adjustsFontForContentSizeCategory = true
    serialNumberLabel.adjustsFontForContentSizeCategory = true
    valueLabel.adjustsFontForContentSizeCategory = true
  }
}
