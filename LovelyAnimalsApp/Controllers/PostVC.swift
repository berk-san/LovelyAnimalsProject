//
//  PostVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseCore
import FirebaseFirestore
import FirebaseAnalytics

class PostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var headerLabel = UILabel()
    var imageView = UIImageView()
    var descriptionText = UITextField()
    var choosePictureButton = UIButton()
    var shareButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToGallery))
        imageView.addGestureRecognizer(gestureRecognizer)

    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Share a lovely animal with your friends"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.systemFont(ofSize: 20)
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "select.png")
        
        view.addSubview(descriptionText)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.placeholder = "Please describe your picture briefly"
        descriptionText.textAlignment = .left
        descriptionText.font = UIFont.systemFont(ofSize: 20)
        descriptionText.borderStyle = .roundedRect
        descriptionText.layer.borderWidth = 0.2
        descriptionText.layer.cornerRadius = 6
        
        view.addSubview(choosePictureButton)
        choosePictureButton.translatesAutoresizingMaskIntoConstraints = false
        choosePictureButton.configuration = .filled()
        choosePictureButton.tintColor = .systemGreen
        choosePictureButton.setTitle("Choose Image", for: .normal)
        choosePictureButton.setTitleColor(.white, for: .normal)
        choosePictureButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        choosePictureButton.titleLabel?.adjustsFontSizeToFitWidth = true
        choosePictureButton.addTarget(self, action: #selector(goToGallery), for: .touchUpInside)
        
        view.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.configuration = .filled()
        shareButton.tintColor = .systemGreen
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        shareButton.titleLabel?.adjustsFontSizeToFitWidth = true
        shareButton.addTarget(self, action: #selector(shareImage), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            headerLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            headerLabel.widthAnchor.constraint(greaterThanOrEqualTo: headerLabel.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 45),
            imageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 16/9),
            
            descriptionText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionText.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            descriptionText.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: 30),
            
            choosePictureButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 45),
            choosePictureButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            choosePictureButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.9),
            choosePictureButton.heightAnchor.constraint(equalToConstant: 40),
            
            shareButton.topAnchor.constraint(equalTo: choosePictureButton.bottomAnchor, constant: 45),
            shareButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            shareButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.9),
            shareButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    @objc func goToGallery() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    @objc func shareImage() {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("myMedia")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpeg")
            imageReference.putData(data, metadata: nil) { metadata, error in
                if error != nil {
                    Common.showAlert(title: "Error", message: error?.localizedDescription ?? "Error", vc: self)
                } else {
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            // DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReference: DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl": imageUrl!, "PostedBy": Auth.auth().currentUser?.email!, "postComment": self.descriptionText.text!, "date": FieldValue.serverTimestamp(), "likes": 0] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost) { error in
                                if error != nil {
                                    Common.showAlert(title: "Error", message: error?.localizedDescription ?? "Error", vc: self)
                                } else {
                                    self.imageView.image = UIImage(named: "select.png")
                                    self.descriptionText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
