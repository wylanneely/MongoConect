//
//  Message.swift
//  MongoDB
//
//  Created by ALIA M NEELY on 9/8/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class MGMessage {
    
    let message: String
    let id: UUID
    let soid: String
    var bsonRep: [String:Any] {
        return ["_id": self.id.uuidString, "message": message]
    }
    var data: Data? {
        let data = try? JSONSerialization.data(withJSONObject: bsonRep, options: .prettyPrinted)
        return data
    }
    
    init(message: String) {
        self.message = message
        self.id = UUID()
        self.soid = "from Local"
    }
    
    init?(json: [String:Any]){
        //change after you figure it out
        guard let testMessage = json["test"] as? String,
            let id = json["_id"] as? [String:Any],
            let soid = id["$oid"] as? String else {return nil}
        self.message = testMessage
        self.id = UUID()
        self.soid = soid
    }
    
    
}
