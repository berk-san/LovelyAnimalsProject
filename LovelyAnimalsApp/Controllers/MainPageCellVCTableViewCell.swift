//
//  MainPageCellVCTableViewCell.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit
import FirebaseFirestore

class MainPageCellVCTableViewCell: UITableViewCell {
    
    var userEmailLabel = UILabel()
    var userImageView = UIImageView()
    var commentLabel = UILabel()
    var likeLabel = UILabel()
    var likeButton = UIButton()
    var documentIDLabel = UILabel()
    
    var isLiked = Bool()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userEmailLabel)
        configureUserEmailLabel()
        setUserEmailLabelConstraints()
        
        addSubview(userImageView)
        configureUserImageView()
        setUserImageViewConstraints()
        
        addSubview(commentLabel)
        configureCommentLabel()
        setCommentLabelConstraints()
        
        addSubview(likeLabel)
        configureLikeLabel()
        setLikeLabelConstraints()
        
        addSubview(likeButton)
        configureLikeButton()
        setLikeButtonConstraints()
        
        addSubview(documentIDLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        self.configureUserEmailLabel()
        self.configureUserImageView()
        self.configureCommentLabel()
        self.configureLikeLabel()
        self.configureLikeButton()
        self.configureDocumentIDLabel()
    }
    
    func configureUserEmailLabel() {
        userEmailLabel.numberOfLines = 0
        userEmailLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setUserEmailLabelConstraints() {
        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        userEmailLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5).isActive = true
        userEmailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userEmailLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func configureUserImageView() {
//        userImageView.image = UIImage(named: "select.png")
    }
    
    func setUserImageViewConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 5).isActive = true
        userImageView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -45).isActive = true
        userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func configureCommentLabel() {
//        commentLabel.text = "My comment"
        commentLabel.numberOfLines = 0
    }
    
    func setCommentLabelConstraints() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: commentLabel.contentScaleFactor).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor).isActive = true
        commentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: commentLabel.contentScaleFactor).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
    }
    
    func configureLikeLabel() {
//        likeLabel.text = "Likes: 0"
    }
    
    func setLikeLabelConstraints() {
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5).isActive = true
        likeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor).isActive = true
        likeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: likeLabel.contentScaleFactor).isActive = true
    }
    
    func configureLikeButton() {
        likeButton.setImage(.init(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = .systemRed
        likeButton.isUserInteractionEnabled = true
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    func setLikeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.topAnchor.constraint(equalTo: likeLabel.topAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor).isActive = true
        likeButton.widthAnchor.constraint(greaterThanOrEqualTo: likeButton.widthAnchor).isActive = true
        likeButton.bottomAnchor.constraint(equalTo:commentLabel.topAnchor, constant: -10).isActive = true
    }
    
    func configureDocumentIDLabel() {
//        commentLabel.text = "My comment"
        documentIDLabel.numberOfLines = 0
    }
    
    func setDocumentIDLabel() {
        documentIDLabel.translatesAutoresizingMaskIntoConstraints = false
        documentIDLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: documentIDLabel.contentScaleFactor).isActive = true
        documentIDLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor).isActive = true
        documentIDLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: documentIDLabel.contentScaleFactor).isActive = true
        documentIDLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
        documentIDLabel.isHidden = true
    }
    
    @objc func likeButtonTapped() {
        let firestoreDatabase = Firestore.firestore()
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            firestoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }
        print("Like button tapped")
    }

}
