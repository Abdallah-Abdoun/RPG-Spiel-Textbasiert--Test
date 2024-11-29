//
//  Battle.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation


func battle(_ player: inout Player, _ enemy: inout Enemy, quests: inout [Quest]) {
    while player.health > 0 && enemy.health > 0 {
        print("\n--- ⚔️ Kampfmenü ---")
        print("1. 🗡️ Angreifen")
        print("2. 🧪 Heilen")
        print("3. 🏃 Fliehen")
        
        let choice = readLine() ?? ""
        
        switch choice {
        case "1":
            player.attack(&enemy)
            if enemy.health > 0 {
                enemy.attack(&player)
            } else {
                print("💀 \(enemy.name) wurde besiegt!")
                player.gainExperience(50)
                updateQuests(&quests, with: enemy.name)
            }
        case "2":
            player.heal()
            enemy.attack(&player)
        case "3":
            print("🏃 Du fliehst aus dem Kampf!")
            return
        default:
            print("❌ Ungültige Auswahl!")
        }
    }
    
    if player.health <= 0 {
        print("☠️ Du wurdest besiegt! Spiel vorbei. ❌")
        exit(0)
    }
}


