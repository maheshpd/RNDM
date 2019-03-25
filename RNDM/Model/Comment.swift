//
//  Comment.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 25/03/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import Foundation
import Firebase
class Comment {
    
    private(set) var username: String!
    private(set) var timestamp: Date!
    private(set) var commentTxt: String!
    
    
    
    init(username: String, timestamp: Date, commentTxt: String) {
        self.username = username
        self.timestamp = timestamp
        self.commentTxt = commentTxt
        
    }
    
    
//    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {
//        var thoughts = [Thought]()
//
//        guard let snap = snapshot else { return thoughts}
//        for document in snap.documents {
//            let data = document.data()
//            let username = data[USERNAME] as? String ?? "Anonymous"
//            let timestamp = data[TIMESTAMP] as? Date ?? Date()
//            let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
//            let numLikes = data[NUM_LIKES] as? Int ?? 0
//            let numComments = data[NUM_COMMENTS] as? Int ?? 0
//            let documentId = document.documentID
//
//            let newThought = Thought(username: username, timestamp: timestamp, thoughtTxt: thoughtTxt, numLikes: numLikes, numComments: numComments, documentId: documentId)
//            thoughts.append(newThought)
//        }
//
//
//        return thoughts
}
