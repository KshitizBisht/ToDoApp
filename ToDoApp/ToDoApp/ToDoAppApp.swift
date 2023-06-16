//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Kshitiz Bisht on 15/06/2023.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ApplicationData())
        }
    }
}
