//
//  LayoutWithSwiftUIApp.swift
//  LayoutWithSwiftUI
//
//  Created by Abdullah Karaboğa on 17.12.2022.
//

import SwiftUI

@main
struct LayoutWithSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
