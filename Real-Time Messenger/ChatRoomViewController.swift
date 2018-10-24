//
//  ChatRoomViewController.swift
//  Real-Time Messenger
//
//  Created by Jacob Finn on 10/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit
import Firebase

class ChatRoomViewController: UIViewController {
    var ref: DatabaseReference!
    var databaseResults: NSDictionary?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        ref.child("channels").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.databaseResults = value
        }) { (error) in
            print(error.localizedDescription)
        }
        guard let databaseResults = databaseResults else {
            print("No data has been stored!")
            return
        }
        print(databaseResults.allKeys)
    }
    
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseResults?.allKeys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ChannelCell
        cell.setup(channelName: "test")
        return cell
    }
    
    
}
