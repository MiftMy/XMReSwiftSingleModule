//
//  MessageModel.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import UIKit

struct MessageModel {
    var index: TimeInterval!
    var title: String!
    var detail: String!
    var icon: String?
    var state: Bool
    
    init(info: Dictionary<String, String>) {
        self.title = info["title"]
        self.detail = info["detail"]
        self.icon = info["icon"]
        self.state = false
        self.index = Date().timeIntervalSince1970
    }
}
