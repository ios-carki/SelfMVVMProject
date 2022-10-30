//
//  MainView.swift
//  SelfMVVMProject
//
//  Created by Carki on 2022/10/29.
//

import UIKit

import SnapKit

class MainView: UIView {
    
    let tableView: UITableView = {
        let view = UITableView()
        
        return view
    }()
    
    let addButton: UIButton = {
        let view = UIButton()
        view.setTitle("셀 추가", for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [tableView, addButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
}
