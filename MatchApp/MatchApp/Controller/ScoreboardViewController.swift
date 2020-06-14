//
//  ScoreboardViewController.swift
//  MatchApp
//
//  Created by Meruyert Tastandiyeva on 5/11/20.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var playerTable: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        playerTable.delegate = self
        playerTable.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Player.get().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreBoardCell", for: indexPath) as! ScoreBoardTableViewCell
        cell.setScoreBoardCell(username: Player.get()[indexPath.row].username, time: String(Player.get()[indexPath.row].time))
        
        return cell
    }
    

    @IBAction func Restart(_ sender: Any) {
        
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    

}
