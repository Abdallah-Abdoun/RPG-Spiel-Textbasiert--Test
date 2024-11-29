//
//  Explore.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation

func explore(_ player: inout Player, gameMode: String, quests: inout [Quest]) {
    print("🗺️ Du gehst auf Entdeckungstour...")
    let encounterChance = Int.random(in: 1...100)
    
    if encounterChance <= 60 {
        // Monster Encounter
        var enemy = generateRandomEnemy()
        print("⚔️ Ein \(enemy.name) taucht auf!")
        battle(&player, &enemy, quests: &quests)
    } else if encounterChance <= 90 {
        // Find Item
        print("🎁 Du findest einen Heiltrank! 🧪")
        player.inventory.append("Health Potion")
    } else {
        // Find Equipment
        let newEquipment = ["Weapon", "Armor"].randomElement()!
        print("✨ Du findest ein \(newEquipment)! 🛡️")
        player.equipment[newEquipment] = (player.equipment[newEquipment] ?? 0) + 5
    }
}
