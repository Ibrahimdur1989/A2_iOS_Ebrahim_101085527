//
//  A2_iOS_Ebrahim_101085527App.swift
//  A2_iOS_Ebrahim_101085527
//
//  Created by Ebrahim Al-Serri on 2026-04-09.
//

import SwiftUI
import CoreData

@main
struct A2_iOS_Ebrahim_101085527App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
