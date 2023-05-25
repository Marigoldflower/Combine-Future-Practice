//
//  ViewController.swift
//  Combine_Future_Practice
//
//  Created by 황홍필 on 2023/05/24.
//

import UIKit
import SnapKit
import SDWebImage
import Combine


class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    var teslaViewModel = TeslaViewModel()
    var cancellable: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupLayout()
        setupDelegate()
        registerTableView()
        fetchNetwork()
        bindData()
        
    }
    
    
    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(0)
            make.top.equalTo(view.snp.top).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }

    
    func setupDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func registerTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }

    
    func fetchNetwork() {
        self.teslaViewModel.fetchNetwork()
    }
    
    
    func bindData() {
        self.teslaViewModel.$networkPublisher.receive(on: DispatchQueue.main).sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &self.cancellable)
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("현재 테이블 뷰 셀 개수는 \(teslaViewModel.networkPublisher.count)")
        return teslaViewModel.networkPublisher.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        
        cell.author.text = teslaViewModel.networkPublisher[indexPath.row].author
        cell.newsSource.text = teslaViewModel.networkPublisher[indexPath.row].source.name
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

