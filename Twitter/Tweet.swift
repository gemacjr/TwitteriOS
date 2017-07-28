//
//  Tweet.swift
//  Twitter
//
//  Created by Ed McCormic on 7/27/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
