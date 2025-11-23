//
//  Explore.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation

func explore(_ player: inout Player, gameMode: GameMode, quests: inout [Quest]) {
    print("🗺️ Du gehst auf Entdeckungstour...")

    if gameMode == .arena {
        var enemy = generateRandomEnemy(healthBonus: 20, attackBonus: 5)
        print("🏟️ Willkommen in der Arena! \(enemy.name) wartet auf dich.")
        battle(&player, &enemy, quests: &quests)
        return
    }

    let encounterChance = Int.random(in: 1...100)
    let combatThreshold = gameMode == .survival ? 80 : 60
    let itemThreshold = gameMode == .survival ? 95 : 90

    if encounterChance <= combatThreshold {
        var enemy = generateRandomEnemy(healthBonus: gameMode == .survival ? 10 : 0, attackBonus: gameMode == .survival ? 5 : 0)
        print("⚔️ Ein \(enemy.name) taucht auf!")
        battle(&player, &enemy, quests: &quests)
    } else if encounterChance <= itemThreshold {
        print("🎁 Du findest einen Heiltrank! 🧪")
        player.inventory.append("Health Potion")
    } else {
        let newEquipment = ["Weapon", "Armor"].randomElement()!
        print("✨ Du findest ein \(newEquipment)! 🛡️")
        player.equipment[newEquipment] = (player.equipment[newEquipment] ?? 0) + 5
    }
}
