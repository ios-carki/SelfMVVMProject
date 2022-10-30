//
//  ViewModel.swift
//  SelfMVVMProject
//
//  Created by Carki on 2022/10/29.
//

import Foundation

import RealmSwift

class ViewModel {
    
    let localRealm = try! Realm()
    var tasks: Observable<Results<Memo>?> = Observable(nil)
    //var saveTasks: Results<Memo>!
    
    
    func inputData() {
        let task = Memo(regDate: Date())
        
        try! localRealm.write {
            localRealm.add(task)
            print("메모 저장완료")
            //self.navigationController?.popViewController(animated: true)
        }
        
        tasks.value = fetchRealm()
    }
    
    func tasksCounter() -> Int {
        
        return tasks.value?.count ?? 0
    }
    
    //@discardableResult
    func fetchRealm() -> Results<Memo> {
        let tasks = localRealm.objects(Memo.self)
        
        return tasks
    }
    
}
