//
//  LoginVC.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 20/03/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import UIKit
import Firebase
class LoginVC: UIViewController {

    //Outlet
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createUserBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 10
        createUserBtn.layer.cornerRadius = 10
        

    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        guard let email = emailText.text,
            let password = passwordText.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error{
                debugPrint("Error signing in: \(error)")
            }else {
                self.dismiss(animated: true, completion: nil )
            }
        }
        
    }
    
}
