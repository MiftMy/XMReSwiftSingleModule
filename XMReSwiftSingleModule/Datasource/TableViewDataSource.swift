//
//  TableViewDataSource.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import UIKit

final class TableViewDataSource<V, M>: NSObject, UITableViewDataSource where V: UITableViewCell {
    
    typealias CellConfiguration = (V, M) -> V
    
    var models: [M]
    private let cellConfigure: CellConfiguration
    private let identifier: String
    
    init(identifier: String, models: [M], configure: @escaping CellConfiguration) {
        self.models = models
        self.identifier = identifier
        self.cellConfigure = configure
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? V
        guard let curCell = cell else {
            fatalError("Identifier or class not registered with this table view")
        }
        
        let model = models[indexPath.row]
        return self.cellConfigure(curCell, model)
    }
}
