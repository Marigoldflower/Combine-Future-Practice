//
//  TableViewCell.swift
//  Combine_Future_Practice
//
//  Created by 황홍필 on 2023/05/24.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {

    
    static let identifier = "TableViewCell"
    
    
    let author: UILabel = {
         let author = UILabel()
         return author
    }()
    
    
    let newsSource: UILabel = {
         let newsSource = UILabel()
         return newsSource
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [author, newsSource])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.addSubview(stackView)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func setupLayout() {
//        author.snp.makeConstraints { make in
//            make.leading.equalTo(self.snp.leading).offset(20)
//            make.top.equalTo(self.snp.top).offset(10)
//            make.width.height.equalTo(50)
//        }
//        
//        
//        newsSource.snp.makeConstraints { make in
//            make.top.leading.equalTo(self.snp.leading).offset(30)
//            make.top.equalTo(self.snp.top).offset(10)
//            make.trailing.equalTo(self.snp.trailing).offset(-20)
//        }
//        
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
    }


}
