//
//  Enemy.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation


struct Enemy {
    var name: String
    var health: Int
    var attackPower: Int
    
    mutating func attack(_ player: inout Player) {
        print("👹 \(name) greift \(player.name) an und verursacht \(attackPower) Schaden! 💥")
        player.health -= attackPower
    }
}


func generateRandomEnemy() -> Enemy {
    let enemies = [
        Enemy(name: "Goblin 👹", health: 50, attackPower: 10),
        Enemy(name: "Orc 🐗", health: 80, attackPower: 15),
        Enemy(name: "Troll 🐲", health: 120, attackPower: 20)
    ]
    return enemies.randomElement()!
}
