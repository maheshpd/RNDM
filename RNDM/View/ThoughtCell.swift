//
//  ThoughtCell.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 16/03/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import UIKit
import Firebase
class ThoughtCell: UITableViewCell {

    //Outlet
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesimg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    
    //Variables
    private var though: Thought!
    
override func awakeFromNib() {
        super.awakeFromNib()
    let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
    likesimg.addGestureRecognizer(tap)
    likesimg.isUserInteractionEnabled = true
    }

    @objc func likeTapped() {
        //Method 1
//        Firestore.firestore().collection(THOUGHTS_REF).document(though.documentId).setData([NUM_LIKES  : though.numLikes + 1], merge: true)
        
        //Method 2
        Firestore.firestore().document("thoughts/\(though.documentId!)")
        .updateData([NUM_LIKES : though.numLikes + 1], completion: nil)
    }
    
    
    func configureCell(thought: Thought){
      self.though = thought
        usernameLbl.text = thought.username
        thoughtTxtLbl.text = thought.thoughtTxt
        likesNumLbl.text = String(thought.numLikes)
        
        
        //Date Formater
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        timestampLbl.text = timestamp
    }
    
    
   
}
