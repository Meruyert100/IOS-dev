//
//  ScoreBoardTableViewCell.swift
//  MatchApp
//
//  Created by Meruyert Tastandiyeva on 5/11/20.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit

class ScoreBoardTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

    }
    
    func setScoreBoardCell(username: String, time: String) {
        
        usernameLabel.text = username
        timeLabel.text = time
        
    }

}
