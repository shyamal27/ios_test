//
//  UserContentListTableViewCell.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import Foundation
import UIKit

class UserContentListTableViewCell: UITableViewCell {
    let imgUserContent: UIImageView = {
        let imgVw = UIImageView()
        imgVw.image = UIImage(named: "placeholder4")
        return imgVw
    }()
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = UIColor.darkText
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return lbl
    }()
    
    let lblDescription: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.gray
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCell()
    }
    
    // MARK: - Set up cell
    
    private func setUpCell() {
        contentView.addSubview(imgUserContent)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)
        
        setConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func setConstraints() {
        let margin = Constants.constantMarginInCell
        
        imgUserContent.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(margin)
            make.top.equalToSuperview().inset(margin)
            make.size.equalTo(CGSize(width: 80, height: 80))
            make.bottom.lessThanOrEqualToSuperview().inset(margin)
        }
        
        lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(imgUserContent.snp.trailing).offset(margin)
            make.top.equalToSuperview().inset(margin)
            make.trailing.equalToSuperview().inset(margin)
        }
        
        lblDescription.snp.makeConstraints { (make) in
            make.leading.equalTo(imgUserContent.snp.trailing).offset(margin)
            make.top.equalTo(lblTitle.snp.bottom)
            make.trailing.equalToSuperview().inset(margin)
            make.bottom.equalToSuperview().inset(margin)
        }
        
    }
    
}
