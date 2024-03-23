//
//  memoUIApp.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

@main
struct memoUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
