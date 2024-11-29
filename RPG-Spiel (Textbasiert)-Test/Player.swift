//
//  Player.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation

struct Player {
    var name: String
    var health: Int
    var attackPower: Int
    var inventory: [String]
    var experience: Int
    var level: Int
    var equipment: [String: Int] // Key: Equipment Type, Value: Bonus
    
    mutating func attack(_ enemy: inout Enemy) {
        let totalAttackPower = attackPower + (equipment["Weapon"] ?? 0)
        print("⚔️ \(name) greift \(enemy.name) an und verursacht \(totalAttackPower) Schaden!")
        enemy.health -= totalAttackPower
    }
    
    mutating func heal() {
        if let potionIndex = inventory.firstIndex(of: "Health Potion") {
            print("🧪 \(name) benutzt einen Heiltrank! 💖")
            health += 20
            inventory.remove(at: potionIndex)
        } else {
            print("❌ Keine Heiltränke im Inventar!")
        }
    }
    
    mutating func gainExperience(_ amount: Int) {
        experience += amount
        print("✨ \(name) erhält \(amount) Erfahrungspunkte!")
        if experience >= level * 100 {
            levelUp()
        }
    }
    
    private mutating func levelUp() {
        level += 1
        attackPower += 5
        health += 20
        print("⬆️ \(name) steigt auf Level \(level) auf! Gesundheit und Angriffskraft haben sich erhöht! 💪")
    }
}
