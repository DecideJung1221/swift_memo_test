//
//  DetailView.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showCompose = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
        VStack{
            ScrollView{
                VStack{
                    
                    HStack{
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate,style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing) {
                
                Button{
                    showCompose = true
                }label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showCompose, content: {
            ComposeView(memo: memo)
        })
            

            Button{
                showDeleteAlert = true
            }label: {
                Image(systemName: "trash")
            }
            .foregroundColor(.red)
            .alert("삭제확인", isPresented: $showDeleteAlert)
            {
                Button(role: .destructive){
                    store.delete(memo: memo)
                    dismiss()
                }label: {
                    Text("삭제")
                }
            }message: {
                Text("삭제할까요?")
            }
            
        
        }
        
    }
}

#Preview {
    NavigationView(content: {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    })
    
}
