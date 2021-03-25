//
//  ViewCell.swift
//  ProfileList
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class ViewCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    func setupData(data: ProfileElement) {
        username.text = data.profile.fullName
        birthday.text = data.profile.birthday
    }
    
}
