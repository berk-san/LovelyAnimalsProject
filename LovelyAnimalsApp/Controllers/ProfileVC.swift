//
//  ProfileVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
    var favouritedPicturesButton = UIButton()
    var likedPicturesButton = UIButton()
    var settingsButton = UIButton()
    var logoutButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(favouritedPicturesButton)
        favouritedPicturesButton.translatesAutoresizingMaskIntoConstraints = false
        favouritedPicturesButton.configuration = .filled()
        favouritedPicturesButton.tintColor = .systemGray
        favouritedPicturesButton.setTitle("Favourited Pictures", for: .normal)
        favouritedPicturesButton.setTitleColor(.white, for: .normal)
        favouritedPicturesButton.addTarget(self, action: #selector(goToFavouritedPictures), for: .touchUpInside)
        
        view.addSubview(likedPicturesButton)
        likedPicturesButton.translatesAutoresizingMaskIntoConstraints = false
        likedPicturesButton.configuration = .filled()
        likedPicturesButton.tintColor = .systemGray
        likedPicturesButton.setTitle("Liked Pictures", for: .normal)
        likedPicturesButton.setTitleColor(.white, for: .normal)
        likedPicturesButton.addTarget(self, action: #selector(goToLikedPictures), for: .touchUpInside)
        
        view.addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.configuration = .filled()
        settingsButton.tintColor = .systemGray
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(.white, for: .normal)
        settingsButton.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.tintColor = .systemGray
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            favouritedPicturesButton.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: 0),
            favouritedPicturesButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            favouritedPicturesButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6),
            
            likedPicturesButton.topAnchor.constraint(equalTo: favouritedPicturesButton.bottomAnchor, constant: 45),
            likedPicturesButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            likedPicturesButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6),
            
            settingsButton.topAnchor.constraint(equalTo: likedPicturesButton.bottomAnchor, constant: 45),
            settingsButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            settingsButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6),
            
            logoutButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 45),
            logoutButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6)
        ])
        
    }
    
    @objc func goToFavouritedPictures() {
        
    }
    
    @objc func goToLikedPictures() {
        
    }
    
    @objc func goToSettings() {
        performSegue(withIdentifier: "toSettingsVC", sender: nil)
    }
    
    @objc func logout() {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "logout", sender: nil)
        } catch {
            print("Error")
        }
    }
}
