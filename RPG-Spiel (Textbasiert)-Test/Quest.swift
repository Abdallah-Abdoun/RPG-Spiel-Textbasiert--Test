//
//  Quest.swift
//  RPG-Spiel (Textbasiert)-Test
//
//  Created by Abdallah Al Abdoun Almashall on 29.11.24.
//

import Foundation


struct Quest {
    var name: String
    var objective: String
    var progress: Int
    var target: Int
    var reward: String
    var isComplete: Bool
    
    mutating func updateProgress() {
        progress += 1
        if progress >= target {
            isComplete = true
            print("✅ Quest abgeschlossen: \(name)")
        }
    }
}

func createInitialQuests(for gameMode: GameMode) -> [Quest] {
    switch gameMode {
    case .story:
        return [
            Quest(name: "Erste Schritte", objective: "Goblin 👹", progress: 0, target: 2, reward: "50 XP", isComplete: false),
            Quest(name: "Dorfbeschützer", objective: "Orc 🐗", progress: 0, target: 1, reward: "Holz-Schild", isComplete: false)
        ]
    case .survival:
        return [
            Quest(name: "Überlebenstag Eins", objective: "Goblin 👹", progress: 0, target: 3, reward: "Health Potion", isComplete: false)
        ]
    case .arena:
        return [
            Quest(name: "Champion werden", objective: "Troll 🐲", progress: 0, target: 1, reward: "Arena-Schwert", isComplete: false)
        ]
    }
}

func updateQuests(_ quests: inout [Quest], with enemyName: String) {
    for i in 0..<quests.count {
        if quests[i].objective == enemyName && !quests[i].isComplete {
            quests[i].updateProgress()
        }
    }
}


func showQuests(_ quests: [Quest]) {
    print("\n--- 🗺️ Quests ---")
    for quest in quests {
        print("📜 \(quest.name): \(quest.progress)/\(quest.target) erledigt. 🎁 Belohnung: \(quest.reward)")
    }
}
