//
//  CommentCell.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 25/03/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameTxt: UILabel!
    @IBOutlet weak var timestampTxt: UILabel!
    @IBOutlet weak var commentTxt: UILabel!
    
    
    func configureCell(comment: Comment) {
        usernameTxt.text = comment.username
        commentTxt.text = comment.commentTxt
        
        //Date Formater
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        commentTxt.text = timestamp
        
    }
    

}
