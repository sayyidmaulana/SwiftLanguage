//
//  NestedViewCellTwo.swift
//  ToDo
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class NestedViewCellTwo: UITableViewCell {
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Time"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.tintColor = .black
        titleLabel.tag = 0
        $0.addArrangedSubview(titleLabel)
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Agenda"
        subtitleLabel.font = UIFont.italicSystemFont(ofSize: 10)
        subtitleLabel.tintColor = .blue
        subtitleLabel.tag = 1
        $0.addArrangedSubview(subtitleLabel)
        let thirdtitleLabel = UILabel()
        thirdtitleLabel.textAlignment = .center
        thirdtitleLabel.text = "Status"
        thirdtitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        thirdtitleLabel.tintColor = .orange
        thirdtitleLabel.tag = 2
        $0.addArrangedSubview(thirdtitleLabel)
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, thirdtitleLabel])
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        return stackView
    }(UIStackView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        addSubview(titleStackView)
        titleStackView.setAnchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 10, paddingLeft: 25, paddingBottom: 10, paddingRight: 25, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getLabel() -> UILabel?
    {
        return titleStackView.arrangedSubviews.first(where: {$0.tag == 0}) as? UILabel
    }
    
    func getLabelTwo() -> UILabel?
    {
        return titleStackView.arrangedSubviews.first(where: {$0.tag == 1}) as? UILabel
    }
    
    func getLabelThree() -> UILabel?
    {
        return titleStackView.arrangedSubviews.first(where: {$0.tag == 2}) as? UILabel
    }
    
    func setupData(data: Data) {
        self.getLabel()?.text = data.time
        self.getLabelTwo()?.text = data.agenda
        self.getLabelThree()?.text = data.status
    }

}
