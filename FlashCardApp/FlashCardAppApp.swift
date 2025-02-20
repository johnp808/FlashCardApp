//
//  FlashCardAppApp.swift
//  FlashCardApp
//
//  Created by John on 2/19/25.
//

import SwiftUI

@main
struct FlashCardAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
