//
//  MainListView.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    //compose뷰를 사용할 때 이용
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView{
            List(store.list){memo in
                MemoCell(memo: memo)
                
                
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar{
                Button{
                    showComposer = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            //새로운 메모를 모달로 표시!
            .sheet(isPresented: $showComposer, content: {
                ComposeView()
            })
        }
    }
}





#Preview {
    MainListView()
        .environmentObject(MemoStore())
}

