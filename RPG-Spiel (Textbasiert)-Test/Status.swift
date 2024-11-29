//
//  Status.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation

func showStatus(_ player: Player) {
    print("\n--- 🧍 Status ---")
    print("🆔 Name: \(player.name)")
    print("💖 Leben: \(player.health)")
    print("⚔️ Angriffskraft: \(player.attackPower)")
    print("⬆️ Level: \(player.level)")
    print("✨ Erfahrungspunkte: \(player.experience)")
    print("🎒 Inventar: \(player.inventory)")
}


