//
//  ViewController.swift
//  ToDo
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

private let identifier = "Cell"
private let identifierTwo = "CellTwo"

class ViewController: UIViewController {
    
    fileprivate let subView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgMenu: UIImageView = {
        let imgViewMenu = UIImageView(image: #imageLiteral(resourceName: "Ellipse"))
        imgViewMenu.contentMode = .scaleAspectFit
        return imgViewMenu
    }()
    fileprivate let textMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.boldSystemFont(ofSize: 30)
        textViewMenu.text = "Hello Sam!"
        textViewMenu.textColor = .white
        textViewMenu.numberOfLines = 2
        return textViewMenu
    }()
    fileprivate let textSubMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.boldSystemFont(ofSize: 30)
        textViewMenu.text = "2 Task for Today"
        textViewMenu.textColor = .orange
        textViewMenu.numberOfLines = 2
        return textViewMenu
    }()
    
    fileprivate let collectionSubview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 247, green: 250, blue: 252, alpha: CGFloat(1.0))
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupView()
    }

    private func setupView() {
        view.addSubview(subView)
        subView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 130)
        subView.addSubview(imgMenu)
        subView.addSubview(textMenu)
        subView.addSubview(textSubMenu)
        imgMenu.setAnchor(top: subView.topAnchor, left: subView.leadingAnchor, bottom: subView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 80, height: 0)
        textMenu.setAnchor(top: subView.topAnchor, left: imgMenu.trailingAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        textSubMenu.setAnchor(top: textMenu.bottomAnchor, left: imgMenu.trailingAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(collectionSubview)
        collectionSubview.setAnchor(top: subView.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionSubview.delegate = self
        collectionSubview.dataSource = self
        collectionSubview.register(ViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionSubview.register(ViewCellTwo.self, forCellWithReuseIdentifier: identifierTwo)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierTwo, for: indexPath) as! ViewCellTwo
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 200)
        } else {
            return CGSize(width: view.frame.width, height: 400)
        }
        
    }
    
    
}

import SwiftUI

@available(iOS 13, *)
struct HomeVCPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        ViewController().toPreview()
    }
}

