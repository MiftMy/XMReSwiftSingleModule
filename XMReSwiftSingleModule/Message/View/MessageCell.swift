//
//  MessageCell.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import UIKit
import SnapKit

class MessageCell: UITableViewCell {
    
    var icon: UIImageView!
    var title: UILabel!
    var detail: UILabel!
    var stateBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    private func setupUI() {
        icon = UIImageView(frame: CGRect(x: 15, y: 10, width: 35, height: 35))
        icon.contentMode = .scaleAspectFill
        
        title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14)
        title.textColor = UIColor.red
        
        detail = UILabel()
        detail.font = UIFont.systemFont(ofSize: 12)
        detail.textColor = UIColor.lightGray
        
        stateBtn = UIButton(type: .system)
        stateBtn.setTitle("✅", for: .normal)
        stateBtn.setTitle("❌", for: .selected)
        
        self.addSubview(icon)
        self.addSubview(title)
        self.addSubview(detail)
        self.addSubview(stateBtn)
        
        icon.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(8)
            make.top.equalTo(icon.snp.top).offset(2)
            make.height.equalTo(14)
        }
        
        detail.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(8)
            make.bottom.equalTo(icon.snp.bottom).offset(-2)
            make.height.equalTo(12)
        }
        
        stateBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
//    override func layout
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
