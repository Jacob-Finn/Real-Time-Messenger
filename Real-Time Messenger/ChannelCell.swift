//
//  ChannelCell.swift
//  Real-Time Messenger
//
//  Created by Jacob Finn on 10/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    @IBOutlet weak var channelNameLabel: UILabel!
    
    func setup(channelName: String) {
        channelNameLabel.text = channelName
    }
    
    
    
}
