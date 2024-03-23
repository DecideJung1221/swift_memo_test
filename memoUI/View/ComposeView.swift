//
//  ComposeView.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    //메모 창 닫기 dismiss방법을 이용
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새메모")
            .navigationBarTitleDisplayMode(.inline)
            //large title 모드는 사용하지 않음
            
            
            // 취소 dismiss 이용
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    }label: {
                        Text("취소")
                    }
                }
            }
            
            
            // Memostore의 insert를 사용하여 저장
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
//                        위의 texteditor의 text를 content로 받음
                        store.insert(memo: content)
                        dismiss()
                    }label: {
                        Text("저장")
                    }
                }
            }
            
        }
    }
}

#Preview {
    ComposeView()
        .environmentObject(MemoStore())
}
