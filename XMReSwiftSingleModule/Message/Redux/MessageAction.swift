//
//  MessageAction.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import ReSwift

enum MsgActionType: Int {
    case MsgAll = 0
    case MsgSelect
    case MsgAdd
    case MsgChange
    case MsgDel
}

struct MessageAction: Action {
    let actionType: MsgActionType
    let param: Any?
    
    init(type: MsgActionType, param: Any?) {
        actionType = type
        self.param = param
    }
}

/// or 下面的形式
struct MessageActionAll: Action {
    let param: [MessageModel]
}

struct MessageActionSelect: Action {
    let param: Int
}

struct MessageActionAdd: Action {
    let param: Int
}

struct MessageActionChange: Action {
    let param: Int
}

struct MessageActionDel: Action {
    let param: Int
}
