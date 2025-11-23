//
//  Game.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation

enum GameMode: String {
    case story = "1"
    case survival = "2"
    case arena = "3"

    var description: String {
        switch self {
        case .story: return "📖 Story-Modus"
        case .survival: return "🛡️ Überlebensmodus"
        case .arena: return "⚔️ Kampfarena"
        }
    }
}

func startGame() {
    print("🌟 Willkommen zum Abdallas RPG! 🌟")
    print("Wie lautet dein Name?")
    let playerName = readLine() ?? "Spieler"

    var player = Player(name: playerName, health: 100, attackPower: 15, inventory: ["Health Potion"], experience: 0, level: 1, equipment: [:])
    let gameMode = promptForGameMode()
    var quests: [Quest] = createInitialQuests(for: gameMode)

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

private func promptForGameMode() -> GameMode {
    print("🕹️ Wähle einen Spielmodus:")
    print("1. 📖 Story-Modus")
    print("2. 🛡️ Überlebensmodus")
    print("3. ⚔️ Kampfarena")

    let input = readLine() ?? "1"

    if let gameMode = GameMode(rawValue: input) {
        print("✅ Du spielst im \(gameMode.description).")
        return gameMode
    }

    print("❌ Ungültige Auswahl, der Story-Modus wird gestartet.")
    return .story
}
