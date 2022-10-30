//
//  FeedVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class MainPageVC: UIViewController {
    
    var tableView = UITableView()
    var userEmailArray = [String]()
    var userImageArray = [String]()
    var commentArray = [String]()
    var likeArray = [Int]()
    var documentIDArray = [String]()
    
    struct Cells {
        static let postCell = "Cell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        getDataFromFirestore()
        
    }
    
    // Firestore'dan verileri çekmek
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                print("****************")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.commentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIDArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        
                        // Firebase Database'de orta sütundaki document ID'lere eşit
                        let documentID = document.documentID
                        self.documentIDArray.append(documentID)
                        if let postedBy = document.get("PostedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.commentArray.append(postComment)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
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
        return userImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.postCell, for: indexPath) as! MainPageCellVCTableViewCell
        cell.setCell()
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.likeLabel.text = "Likes: \(likeArray[indexPath.row])"
        cell.documentIDLabel.text = documentIDArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}
