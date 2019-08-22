//
//  CollectionViewDataSource.swift
//  XMReSwift
//
//  Created by 梁小迷 on 17/8/19.
//  Copyright © 2019年 Mifit. All rights reserved.
//

import UIKit

final class CollectionViewDataSource<V, M>: NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
    
    typealias CellConfiguration = (V, M) -> V
    
    private let models: [M]
    private let cellConfigure: CellConfiguration
    private let identifier: String
    
    init(identifier: String, models: [M], cellConfigure: @escaping CellConfiguration) {
        self.models = models
        self.identifier = identifier
        self.cellConfigure = cellConfigure
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? V
        
        guard let currentCell = cell else {
            fatalError("Identifier or class not registered with this collection view")
        }
        
        let model = models[indexPath.row]
        
        return cellConfigure(currentCell, model)
    }
}
