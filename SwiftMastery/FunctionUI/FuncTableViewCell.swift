//
//  FuncTableViewCell.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/26.
//

import UIKit

class FuncTableViewCell: BaseTableViewCell {
    
    var funcNameLabel: UILabel!
    var funcDescLabel: UILabel!

    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupFuncNameLabel() {
        self.funcNameLabel = self.createLabel()
        self.funcNameLabel.textColor = .black
        self.contentView.addSubview(self.funcNameLabel)
        self.funcNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.funcNameLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
    }
    
    func setupFuncDescLabel() {
        self.funcDescLabel = self.createLabel()
        self.funcDescLabel.textColor = .gray
    }
    
    func createLabel() -> UILabel {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "PingFang-TC", size: 14)

        nameLabel.textAlignment = .left
        return nameLabel
    }

}
