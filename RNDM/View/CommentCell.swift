//
//  CommentCell.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 25/03/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import UIKit
import Firebase

protocol CommentDelegate {
    func commentOptionsTapped(comment: Comment)
}



class CommentCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameTxt: UILabel!
    @IBOutlet weak var timestampTxt: UILabel!
    @IBOutlet weak var commentTxt: UILabel!
    @IBOutlet weak var optionsMenu: UIImageView!
    
    //Varaibles
    private var comment: Comment!
    private var delegate: CommentDelegate?
    
    
    func configureCell(comment: Comment, delegate: CommentDelegate) {
        usernameTxt.text = comment.username
        commentTxt.text = comment.commentTxt
        optionsMenu.isHidden = true
        self.comment = comment
        self.delegate = delegate
        
        //Date Formater
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        timestampTxt.text = timestamp
        
        if comment.userId ==  Auth.auth().currentUser?.uid {
            optionsMenu.isHidden = false
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(commentOptionsTapped))
            optionsMenu.addGestureRecognizer(tap)
        }
        
    }
    
    @objc func commentOptionsTapped() {
        delegate?.commentOptionsTapped(comment: comment)
    }

}
