//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Ed McCormic on 7/24/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
}