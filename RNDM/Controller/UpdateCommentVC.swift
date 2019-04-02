//
//  UpdateCommentVC.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 02/04/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import UIKit
import Firebase
class UpdateCommentVC: UIViewController {

    @IBOutlet weak var commentTxt: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    //Variables
    var commentData: (comment: Comment, thought: Thought)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       commentTxt.layer.cornerRadius = 10
        updateBtn.layer.cornerRadius = 10
        commentTxt.text = commentData.comment.commentTxt
    }
    
    @IBAction func updateTapped(_ sender: UIButton) {
        Firestore.firestore().collection(THOUGHTS_REF).document(commentData.thought.documentId)
        .collection(COMMENTS_REF).document(commentData.comment.documentId)
            .updateData([COMMENT_TXT : commentTxt.text]) { (error) in
                if let error = error {
                    debugPrint("Unable yo update comment: \(error.localizedDescription)")
                }else {
                    self.navigationController?.popViewController(animated: true)
                }
        }
    }
}
