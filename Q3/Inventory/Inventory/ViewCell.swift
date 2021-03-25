//
//  ViewCell.swift
//  Inventory
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class ViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    
    func setupData(data: InventoryElement) {
        self.name.text = data.name
        self.type.text = data.type
    }
}
