//
//  ViewCell.swift
//  ToDo
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

private let identifier = "Cell"

class ViewCell: UICollectionViewCell {
    
    var dataObject: [MainData] = [
        MainData(img: #imageLiteral(resourceName: "Ellipse4"), day: "S", date: "1"),
        MainData(img: UIImage(named: "Ellipse4")!, day: "S", date: "2"),
        MainData(img: #imageLiteral(resourceName: "Ellipse4"), day: "M", date: "1"),
        MainData(img: UIImage(named: "Ellipse4")!, day: "T", date: "2"),
        MainData(img: #imageLiteral(resourceName: "Ellipse4"), day: "W", date: "1"),
        MainData(img: UIImage(named: "Ellipse4")!, day: "T", date: "2"),
        MainData(img: #imageLiteral(resourceName: "Ellipse4"), day: "F", date: "1"),
        MainData(img: UIImage(named: "Ellipse4")!, day: "S", date: "2"),
        MainData(img: #imageLiteral(resourceName: "Ellipse4"), day: "S", date: "1"),
        MainData(img: UIImage(named: "Ellipse4")!, day: "M", date: "2"),
        MainData(img: #imageLiteral(resourceName: "Ellipse4"), day: "T", date: "1"),
        MainData(img: UIImage(named: "Ellipse4")!, day: "W", date: "2")
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let textMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.boldSystemFont(ofSize: 15)
        textViewMenu.text = "Sun, Sept 14 2020"
        return textViewMenu
    }()
    
    fileprivate let collectionSubview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 247, green: 250, blue: 252, alpha: CGFloat(1.0))
        return cv
    }()
    
    private func setupView() {

        addSubview(textMenu)
        textMenu.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        addSubview(collectionSubview)
        collectionSubview.setAnchor(top: textMenu.bottomAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        collectionSubview.delegate = self
        collectionSubview.dataSource = self
        collectionSubview.register(NestedViewCell.self, forCellWithReuseIdentifier: identifier)

    }
    
}

extension ViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NestedViewCell
        let list = dataObject[indexPath.item]
        cell.page = list
        cell.imgMenu.image = list.img
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
