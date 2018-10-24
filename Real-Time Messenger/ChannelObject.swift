//
//  ChannelObject.swift
//  Real-Time Messenger
//
//  Created by Jacob Finn on 10/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//
import FirebaseDatabase
import Foundation

struct ChannelObject {
    let ID: Int
    let name: String

    init(ID: Int, name: String) {
        self.name = name
        self.ID = ID
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String : AnyObject]
        ID = snapshotValue["ID"] as! Int
        name = snapshotValue["name"] as! String
    }
    
    func toAnyObject() -> Any {
        return [
            "ID" : ID,
            "name" : name
        ]
    }
    
    
}
