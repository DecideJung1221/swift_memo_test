//
//  MainListView.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    
    var body: some View {
        NavigationView{
            List(store.list){memo in
                MemoCell(memo: memo)
                
                
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
        }
    }
}





#Preview {
    MainListView()
        .environmentObject(MemoStore())
}

