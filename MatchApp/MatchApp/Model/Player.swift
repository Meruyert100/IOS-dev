//
//  Player.swift
//  MatchApp
//
//  Created by Meruyert Tastandiyeva on 5/11/20.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import Foundation

class Player {
    
    var username: String = ""
    var time: Double = 0.0
    
    init(username: String, time: Double ){
        self.username = username
        self.time = time
    }
    
    static func get() -> [Player] {
        var players = [Player]()
        let defaults = UserDefaults.init()
        let names = defaults.stringArray(forKey: "names") ?? [String]()
        let times = defaults.stringArray(forKey: "scores") ?? [String]()
        
        /*defaults.removeObject(forKey: "names")
        defaults.removeObject(forKey: "scores")
        defaults.removeObject(forKey: "levels")
        */
        for index in 0..<names.count {
            let player = Player(username: names[index], time: Double(times[index])!)
            players.append(player)
        }
        return players.sorted(by: { $0.time > $1.time })
    }
    
    static func save(player: Player) {
        var players = Player.get()
        players.append(player)
        var names = [String]()
        var times = [String]()
        
        for player in players {
            names.append(player.username)
            times.append(String(player.time))
        }
        
        UserDefaults.standard.set(names, forKey: "names")
        UserDefaults.standard.set(times, forKey: "timess")
    }
}
