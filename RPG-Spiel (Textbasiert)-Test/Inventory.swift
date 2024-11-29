//
//  Inventory.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation


func showInventory(_ player: Player) {
    print("\n--- 🎒 Inventar ---")
    for (index, item) in player.inventory.enumerated() {
        print("\(index + 1). \(item) 🧪")
    }
    print("🛡️ Ausrüstung: \(player.equipment)")
}
