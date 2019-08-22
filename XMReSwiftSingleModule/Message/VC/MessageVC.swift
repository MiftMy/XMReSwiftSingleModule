//
//  MessageVC.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import UIKit
import ReSwift

class MessageVC: UIViewController, UITableViewDelegate {
    
    var tableView: UITableView!
    var dataSource: TableViewDataSource<MessageCell, MessageModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
    }

    
    func setupUI() {
        self.title = "Message"
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        self.view.addSubview(tableView)
        tableView.register(MessageCell.self, forCellReuseIdentifier: "MessageCell")
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        let addItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addItem(sender:)))
        let changeItem = UIBarButtonItem(title: "change", style: .plain, target: self, action: #selector(changeItem(sender:)))
        let delItem = UIBarButtonItem(title: "del", style: .plain, target: self, action: #selector(delItem(sender:)))
        let loadItem = UIBarButtonItem(title: "reload", style: .plain, target: self, action: #selector(reloadItem(sender:)))
        self.navigationItem.rightBarButtonItems = [loadItem, addItem, changeItem, delItem]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 1、听store
        MessageStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 取消监听store
        MessageStore.unsubscribe(self)
    }
    
    @objc func reloadItem(sender: AnyObject) {
        // 本地数据or网络请求回来的or其他
        let itemList: NSMutableArray = NSMutableArray()
        for index in 0...10 {
            let title = String(format: "当前 :\(index)")
            let model = MessageModel(info: ["title": "Title\(title)", "detail": "内容描述：\(index)"])
            itemList.add(model)
        }
        MessageStore.dispatch(MessageAction(type: .MsgAll, param: itemList))
    }
    @objc func addItem(sender: AnyObject) {
        let title = "随机Title：\( arc4random())"
        let detail = "内容啊。。。。。\(title)"
        let addAction = MessageAction(type: .MsgAdd, param: ["title": title, "detail": detail])
        MessageStore.dispatch(addAction)
    }
    @objc func changeItem(sender: AnyObject) {
        let rangeIndex = arc4random()
        let title = "随机改变前三：\(rangeIndex)"
        let detail = "哈哈哈哈哈\(title)"
        let index = Int(arc4random() % 3)
        let changeAction = MessageAction(type: .MsgChange, param: ["title": title, "detail": detail, "index":index])
        MessageStore.dispatch(changeAction)
    }
    @objc func delItem(sender: AnyObject) {
        let action = MessageAction(type: .MsgDel, param: 0)
        MessageStore.dispatch(action)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 55.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // store发送action
        MessageStore.dispatch(MessageAction(type: .MsgSelect, param: indexPath.row))
    }
}

// 2、所有action都会回调这里。
extension MessageVC: StoreSubscriber {
    
    func newState(state: MessageState) {
        if let temDS = dataSource {
            temDS.models = state.itemList
        } else {
            dataSource = TableViewDataSource(identifier: "MessageCell", models: state.itemList, configure: { (cell, model) -> MessageCell in
                cell.title.text = model.title
                cell.detail.text = model.detail
                cell.stateBtn.isSelected = model.state
                cell.icon.image = UIImage(named: "man")
                return cell
            })
            tableView.dataSource = dataSource
        }
        tableView.reloadData()
    }
}
