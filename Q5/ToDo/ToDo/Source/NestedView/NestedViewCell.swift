//
//  NestedViewCell.swift
//  ToDo
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class NestedViewCell: UICollectionViewCell {
    
    var page: MainData? {
        didSet {
            guard let unwrappedPageLogin = page else { return }
            imgMenu.image = unwrappedPageLogin.img
            let attrText = NSMutableAttributedString(string: unwrappedPageLogin.day ?? "", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
            attrText.append(NSAttributedString(string: "\n\n\n\(unwrappedPageLogin.date ?? "")", attributes: [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            textMenu.attributedText = attrText
            textMenu.textAlignment = .center
        }
    }
    
    lazy var imgMenu: UIImageView = {
        let imgViewMenu = UIImageView(image: #imageLiteral(resourceName: "Ellipse4"))
        imgViewMenu.contentMode = .scaleAspectFit
        return imgViewMenu
    }()
    fileprivate let textMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.boldSystemFont(ofSize: 30)
        textViewMenu.text = ""
        textViewMenu.textColor = .white
        textViewMenu.numberOfLines = 2
        return textViewMenu
    }()
    fileprivate let textSubMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.boldSystemFont(ofSize: 30)
        textViewMenu.text = ""
        textViewMenu.textColor = .white
        textViewMenu.numberOfLines = 2
        return textViewMenu
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        cellShadow()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imgMenu)
        addSubview(textMenu)
        addSubview(textSubMenu)
        imgMenu.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
        textMenu.setAnchor(top: imgMenu.bottomAnchor, left: leadingAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        textSubMenu.setAnchor(top: textMenu.bottomAnchor, left: leadingAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    private func cellShadow() {
        self.backgroundColor = .white
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 3.0
        self.layer.cornerRadius = 10
    }

}
