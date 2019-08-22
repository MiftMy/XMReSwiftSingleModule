//
//  MessageState.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import ReSwift

// 界面需要的数据
struct MessageState: StateType {
    var itemList: Array<MessageModel>
    
    init() {
        itemList = Array<MessageModel>()
    }
}
