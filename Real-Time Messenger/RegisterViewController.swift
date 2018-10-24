//
//  RegisterViewController.swift
//  Real-Time Messenger
//
//  Created by Jacob Finn on 10/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            guard let user = authResult?.user else {
                // Creation was unsuccessful. Something went wrong
                print(error?.localizedDescription as Any)
                return
            }
            print("User created!")
            self.returnToLogin()
        }
    }
    
    func returnToLogin() {
        performSegue(withIdentifier: "unwindToLogin", sender: self)
    }
    
    
    
    
    
    @IBAction func registerTapped(_ sender: Any) {
        
        guard let userEmail = emailTextField.text else {
            return
        }
        guard let userPassword = passwordTextField.text else {
            return
        }
        registerUser(email: userEmail, password: userPassword)
    }
    
    
    
}
