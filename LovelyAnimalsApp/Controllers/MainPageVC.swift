//
//  FeedVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit

class MainPageVC: UIViewController {
    
    var tableView = UITableView()
    var posts = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    struct Cells {
        static let postCell = "Cell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        title = "Main Page"
        
        // set delegates
        setTableViewDelegates()
        
        // set row height
        tableView.rowHeight = 300
        
        // register cells
        tableView.register(MainPageCellVCTableViewCell.self, forCellReuseIdentifier: Cells.postCell)
        
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MainPageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.postCell, for: indexPath) as! MainPageCellVCTableViewCell
        cell.setCell()
        return cell
    }
    
}
