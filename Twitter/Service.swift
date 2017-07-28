//
//  Service.swift
//  Twitter
//
//  Created by Ed McCormic on 7/27/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully fetched our json objects")
            completion(homeDatasource, nil)
            
        }) { (err) in
            
//            let err = err as? APIError<JSONError>
//            err?.response?.statusCode
            
            
            
            completion(nil, err)
            
        }
        
    }
    
    class JSONError: JSONDecodable {
        
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
    
}
