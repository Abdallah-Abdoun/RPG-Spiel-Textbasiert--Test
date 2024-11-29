//
//  Game.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation

func startGame() {
    print("🌟 Willkommen zum mein Spiel RPG! 🌟")
    print("Wie lautet dein Name?")
    let playerName = readLine() ?? "Spieler"
    
    var player = Player(name: playerName, health: 100, attackPower: 15, inventory: ["Health Potion"], experience: 0, level: 1, equipment: [:])
    var quests: [Quest] = []
    
    print("🕹️ Wähle einen Spielmodus:")
    print("1. 📖 Story-Modus")
    print("2. 🛡️ Überlebensmodus")
    print("3. ⚔️ Kampfarena")
    let gameMode = readLine() ?? "1"
    
    var gameRunning = true
    
    while gameRunning {
        print("\n--- 📜 Hauptmenü ---")
        print("1. 🚶 Erkunden")
        print("2. 🎒 Inventar")
        print("3. 🧍 Status anzeigen")
        print("4. 🗺️ Quests anzeigen")
        print("5. ❌ Spiel beenden")
        
        let choice = readLine() ?? ""
        
        switch choice {
        case "1":
            explore(&player, gameMode: gameMode, quests: &quests)
        case "2":
            showInventory(player)
        case "3":
            showStatus(player)
        case "4":
            showQuests(quests)
        case "5":
            print("👋 Spiel wird beendet. Bis bald! 🌟")
            gameRunning = false
        default:
            print("❌ Ungültige Auswahl, bitte erneut versuchen.")
        }
    }
}
