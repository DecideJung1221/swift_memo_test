//
//  MemoCell.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import SwiftUI

//메모 셀
struct MemoCell: View{
    @ObservedObject var memo: Memo
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    MemoCell(memo: Memo(content: "test"))
}
