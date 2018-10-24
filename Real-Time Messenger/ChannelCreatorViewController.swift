//
//  ChannelCreatorViewController.swift
//  Real-Time Messenger
//
//  Created by Jacob Finn on 10/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChannelCreatorViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    var ref: DatabaseReference!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let channelName = titleTextField.text else {
            print("Error")
            return
        }
        
        let channelSetup: [String : String] = [
            "name" : channelName,
            "messages" : "noMessages"
        ]
        
        
        self.ref.child("channels").child(channelName).childByAutoId().setValue(channelName)
        self.ref.child("channels").child(channelName).setValue(channelSetup)
        
        

    }
    
    
    
}
