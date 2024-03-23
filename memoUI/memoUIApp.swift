//
//  memoUIApp.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

@main
struct memoUIApp: App {
    //메모 저장소를 속성으로 먼저 저장
    @StateObject var store = MemoStore()
    
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
