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
    @IBOutlet weak var tableView: UITableView!
    var channelData: [String? : String?] = [:]
    var channels: [String] = []
    var handle: DatabaseHandle?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ref = Database.database().reference()
        handle = ref?.child("channels").observe( .childChanged , with: { (snapshot) in
            print("\n\n\n\n\nADDING NEW")
            if let value = snapshot.value as? [String : String] {
                print(value["name"])
                guard let channelName = value["name"] else {
                    print("nil found")
                    return
                }
                if self.channels.contains(channelName) {
                    print("Already exists")
                } else {
                self.channels.append(channelName)
                self.tableView.reloadData()
                }
                print("\n\n\n\n\n")
            }
            
        })
        
    }
    
    func setupChannels () {
        channels = []
        ref = Database.database().reference()
        ref.child("channels").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            print(value?.allKeys)
            let channelNames = value?.allKeys as! [String]
            self.channels = channelNames as! [String]
            self.tableView.reloadData()
    })
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ref.removeObserver(withHandle: handle!)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupChannels()
    
    }
    
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ChannelCell
        print("setting up \(indexPath.row)")
        print(channels.count)
        cell.setup(channelName: channels[indexPath.row])
        return cell
    }
    
    
}
