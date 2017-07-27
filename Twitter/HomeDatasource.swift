//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Ed McCormic on 7/24/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Ed McCormic", username: "@swiftbeard", bioText: "Kale chips listicle tousled kinfolk street art artisan. Fanny pack keytar thundercats readymade trust fund. Dreamcatcher migas glossier schlitz ennui. Poke franzen slow-carb, everyday carry XOXO man bun readymade chicharrones +1.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let rayUser = User(name: "Ray Wenderlich", username: "@rwendelich", bioText: "Kale chips listicle tousled kinfolk street art artisan. Fanny pack keytar thundercats readymade trust fund. Dreamcatcher migas glossier schlitz ennui.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        let kindleUser = User(name: "Katy Mac", username: "@kmccormic", bioText: "Kale chips listicle tousled kinfolk street art artisan. Fanny pack keytar thundercats readymade trust fund. Dreamcatcher migas glossier schlitz ennui. Fanny pack keytar thundercats readymade trust fund. Dreamcatcher migas glossier schlitz ennui.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        return [brianUser, rayUser, kindleUser]
    }()
    
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
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
}
