//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Ed McCormic on 7/24/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        
        let userJsonarray = json["users"].array
        self.users = userJsonarray!.map{return User(json: $0)}

        var tweets = [Tweet]()
        let tweetsJsonArray = json["tweets"].array
        
        
        for  tweetJson in tweetsJsonArray! {
            print(tweetJson)
            
            let userJson = tweetJson["user"]
            let user = User(json: userJson)
            
            let message = tweetJson["message"].stringValue
            
            let tweet = Tweet(user: user, message: message)
            tweets.append(tweet)
            
        }
        
        self.tweets = tweets
    }
    
    
    let tweets: [Tweet]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    
    override func numberOfSections() -> Int {
        
        return 2
        
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
}
