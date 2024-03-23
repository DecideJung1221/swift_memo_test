//
//  Memo.swift
//  memoUI
//
//  Created by 정혜정 on 3/23/24.
//

import Foundation
import SwiftUI

//idenfifiable -- 데이터를 리스트에 쉽게 바인딩 하기 위해 필요
//observableObject -- 메모를 편집할 때 뷰를 자동으로 업데이트 반영
class Memo: Identifiable, ObservableObject{
    let id: UUID
    
    //새로운 값을 저장할 때마다 바인딩 되어 있는 ui가 자동으로 업데이트 된다.
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
