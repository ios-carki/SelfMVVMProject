//
//  Memo.swift
//  SelfMVVMProject
//
//  Created by Carki on 2022/10/29.
//

import Foundation

import RealmSwift

class Memo: Object {
    
    @Persisted var regDate = Date() //등록날짜
    
    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(regDate: Date) {
        self.init()
        self.regDate = regDate
    }
}
