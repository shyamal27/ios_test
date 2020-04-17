//
//  BaseViewController.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol BaseViewProtocol: class {
    @objc func clickOnRetry()
}

class BaseViewController: UIViewController {
    
    let lblNoInternetMsg: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textColor = UIColor.red
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let btnRetry: UIButton = {
        let btn = UIButton()
        btn.setTitle("Retry", for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(BaseViewProtocol.clickOnRetry), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        setNoInternetView()
    }
    
    // MARK: - Set Up No internet view
    
    private func setNoInternetView() {
        view.addSubview(lblNoInternetMsg)
        view.addSubview(btnRetry)
        let margin = Constants.constantMarginInCell
        
        lblNoInternetMsg.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY)
            make.leading.equalToSuperview().offset(margin)
            make.trailing.equalToSuperview().inset(margin)
        }
        
        btnRetry.snp.makeConstraints { (make) in
            make.top.equalTo(lblNoInternetMsg.snp.bottom).offset(margin)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize(width: 80, height: 30))
        }
        
        lblNoInternetMsg.isHidden = true
        btnRetry.isHidden = true
    }
    
    // MARK: - Show No Internet View
    
    final func showInternetViewWithMsg(msg: String) {
        if !msg.isEmpty {
            navigationItem.rightBarButtonItem = nil
            lblNoInternetMsg.isHidden = false
            btnRetry.isHidden = false
            lblNoInternetMsg.text = msg
        } else {
            lblNoInternetMsg.isHidden = true
            btnRetry.isHidden = true
            lblNoInternetMsg.text = ""
        }
    }
    
}
