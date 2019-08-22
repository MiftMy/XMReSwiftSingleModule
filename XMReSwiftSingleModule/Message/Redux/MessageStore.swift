//
//  MessageStore.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import ReSwift

var MessageStore = Store<MessageState> (reducer: MessageReducer, state: nil)
