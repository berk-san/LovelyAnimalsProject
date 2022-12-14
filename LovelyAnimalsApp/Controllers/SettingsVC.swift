//
//  SettingsVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var settingsTableView = UITableView()
    let settingsArray = ["Change Username", "Change Password", "Delete Account"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
    }
    
    
    func setupLayout() {
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(settingsTableView)
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
//        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = settingsArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight: CGFloat = CGFloat()
        cellHeight = 50
        return cellHeight
    }
}
