//
//  MessageReducer.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import ReSwift


func MessageReducer(action: Action, state: MessageState?) -> MessageState {
    var state = state ?? MessageState()
    if let act = action as? MessageAction {
        switch act.actionType {
            case .MsgAll:
                let items = act.param as! [MessageModel]
                state.itemList.append(contentsOf: items)
            case .MsgSelect:
                let selIndex = act.param as! Int
                var fmodel = state.itemList[selIndex]
                fmodel.state = !fmodel.state
                state.itemList[selIndex] = fmodel
            case .MsgChange:
                let info = act.param as! Dictionary<String, Any>
                let index = info["index"] as! Int
                if index < state.itemList.count {
                    var curModel = state.itemList[index]
                    if let tt = info["title"] {
                        curModel.title = tt as? String
                    }
                    if let dt = info["detail"] {
                        curModel.detail = dt as? String
                    }
                    if let ic = info["icon"] {
                        curModel.icon = ic as? String
                    }
                    
                    state.itemList[index] = curModel
                }
            case .MsgAdd:
                let model =  MessageModel(info: act.param as! Dictionary<String, String>)
                state.itemList.append(model)
            case .MsgDel:
                let selIndex = act.param as! Int
                if state.itemList.count > selIndex {
                    state.itemList.remove(at: selIndex)
                }
        }
    }
    return state
}

func addFromList(state: inout MessageState, items: [MessageModel]) {
    state.itemList.append(contentsOf: items)
}

func finModel(list: Array<MessageModel>, index: TimeInterval) -> MessageModel? {
    for model in list {
        if model.index == index {
            return model
        }
    }
    return nil
}
