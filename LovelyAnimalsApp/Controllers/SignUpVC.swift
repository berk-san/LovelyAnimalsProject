//
//  SignUpVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit

class SignUpVC: UIViewController {
    
    var closeButton = UIButton()
    var emailLabel = UILabel()
    var emailText = UITextField()
    var passwordLabel = UILabel()
    var passwordText = UITextField()
    var confirmPasswordLabel = UILabel()
    var confirmPasswordText = UITextField()
    var registerButton = UIButton()
    
    let colorBackground = UIColor(red: 255/255.0, green: 247/255.0, blue: 233/255.0, alpha: 1)
    let colorOrange = UIColor(red: 255/255, green: 110/255, blue: 18/255, alpha: 0.8)
    let colorBorderOrange = CGColor(red: 255/255, green: 110/255, blue: 18/255, alpha: 0.8)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = colorBackground
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.configuration = .plain()
        closeButton.setTitleColor(colorOrange, for: .normal)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(goToSignInVC), for: .touchUpInside)
        view.addSubview(closeButton)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "E-Mail"
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(emailLabel)
        
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailText.placeholder = "Please enter your e-mail"
        emailText.textAlignment = .left
        emailText.font = UIFont.systemFont(ofSize: 18)
        emailText.borderStyle = .roundedRect
        emailText.layer.borderWidth = 0.6
        emailText.layer.borderColor = colorBorderOrange
        emailText.layer.cornerRadius = 6
        view.addSubview(emailText)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .left
        passwordLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(passwordLabel)
        
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.placeholder = "Please enter your password"
        passwordText.textAlignment = .left
        passwordText.font = UIFont.systemFont(ofSize: 18)
        passwordText.borderStyle = .roundedRect
        passwordText.layer.borderWidth = 0.6
        passwordText.layer.borderColor = colorBorderOrange
        passwordText.layer.cornerRadius = 6
        view.addSubview(passwordText)
        
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.textAlignment = .left
        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(confirmPasswordLabel)
        
        confirmPasswordText.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordText.placeholder = "Please re-enter your password"
        confirmPasswordText.textAlignment = .left
        confirmPasswordText.font = UIFont.systemFont(ofSize: 18)
        confirmPasswordText.borderStyle = .roundedRect
        confirmPasswordText.layer.borderWidth = 0.6
        confirmPasswordText.layer.borderColor = colorBorderOrange
        confirmPasswordText.layer.cornerRadius = 6
        view.addSubview(confirmPasswordText)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.configuration = .filled()
        registerButton.tintColor = colorOrange
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.setTitle("REGISTER", for: .normal)
        registerButton.addTarget(self, action: #selector(goToSignInVC), for: .touchUpInside)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            closeButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            closeButton.widthAnchor.constraint(greaterThanOrEqualTo: closeButton.widthAnchor),
            closeButton.heightAnchor.constraint(greaterThanOrEqualToConstant: closeButton.contentScaleFactor),
            
            emailLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 45),
            emailLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            emailLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2),
            emailText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            emailText.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            passwordLabel.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            passwordLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            passwordText.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2),
            passwordText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            passwordText.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            confirmPasswordText.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 2),
            confirmPasswordText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            confirmPasswordText.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            registerButton.topAnchor.constraint(equalTo: confirmPasswordText.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0.8)
        ])
    }
    
    @objc func goToSignInVC() {
        
        // Hata kontrolü yapılacak ve giriş başarılı alert'i gösterildikten sonra giriş ekranına dönüyoruz.
        self.dismiss(animated: true)
    }
    
}
