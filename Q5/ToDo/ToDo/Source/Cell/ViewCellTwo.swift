//
//  ViewCellTwo.swift
//  ToDo
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

private let identifier = "Cell"

class ViewCellTwo: UICollectionViewCell {
    
    var dataObject: [Data] = [
        Data(time: "09:00 AM", agenda: "Login", status: "Complete"),
        Data(time: "10:00 AM", agenda: "Introduction Page", status: "Pending"),
        Data(time: "09:30 AM", agenda: "Social Media", status: "Pending")
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
        tableView.setAnchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        tableView.register(NestedViewCellTwo.self, forCellReuseIdentifier: identifier)
    }

}

extension ViewCellTwo: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NestedViewCellTwo
        let dataOb = dataObject[indexPath.item]
        cell.setupData(data: dataOb)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

