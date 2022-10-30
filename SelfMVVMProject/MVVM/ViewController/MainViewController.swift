//
//  MainViewController.swift
//  SelfMVVMProject
//
//  Created by Carki on 2022/10/29.
//

import UIKit

import RealmSwift

class MainViewController: UIViewController {
    
    let mainView = MainView()
    let viewModel = ViewModel()
    
    let localRealm = try! Realm()
    var tasks: Results<Memo>! {
        didSet {
            mainView.tableView.reloadData()
            print("Task Changed!")
        }
    }
    
    let dateFormatter: DateFormatter = {
        let dateFormat = DateFormatter()
        
        return dateFormat
    }()
    
    override func loadView() {
        view = mainView
        view.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Realm is located at:", localRealm.configuration.fileURL!)
        tableSetting()
        fetchRealm()
        mainView.addButton.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        
        viewModel.tasks.bind { value in
            self.mainView.tableView.reloadData()
        }
    }
    
    
    func tableSetting() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func fetchRealm() {
        //tasks = localRealm.objects(Memo.self)
        viewModel.fetchRealm()
    }
    
    @objc func addCell() {
//        let task = Memo(regDate: Date())
//
//        try! localRealm.write {
//            localRealm.add(task)
//            print("메모 저장완료")
//        }
//        mainView.tableView.reloadData()
        viewModel.inputData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return viewModel.saveTasks.count
        //return tasks.count
        return viewModel.tasksCounter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(viewModel.tasks.value?[indexPath.row].regDate ?? Date())"
        //cell.textLabel?.text = "\(viewModel.tasks.value?[indexPath.row].regDate)"
        
        return cell
    }
    
    
}
