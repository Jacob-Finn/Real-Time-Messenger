//
//  LoginViewController.swift
//  Real-Time Messenger
//
//  Created by Jacob Finn on 10/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    
    
    @IBAction func submitTapped(_ sender: Any) {
        
        guard let userEmail = emailTextField.text else {
            print("No email set")
            return
        }
        guard let userPassword = passwordTextField.text else {
            print("No password set")
            return
        }
        
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { (user, error) in
            // ...
            if let userError = error {
                print("didn't log in")
            } else {
                print("logged in")
                self.performSegue(withIdentifier: "loggedIn", sender: self)
            }
            }
        }
    
    
    
    
    @IBAction func unwindToLogin(segue:UIStoryboardSegue) { }
    
}
