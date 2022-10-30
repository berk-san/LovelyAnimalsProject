//
//  SignInVC.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var emailText = UITextField()
    var passwordLabel = UILabel()
    var passwordText = UITextField()
    var signInButton = UIButton()
    var signUpButton = UIButton()
    
    let colorBackground = UIColor(red: 255/255.0, green: 247/255.0, blue: 233/255.0, alpha: 1)
    let colorOrange = UIColor(red: 255/255, green: 110/255, blue: 18/255, alpha: 0.8)
    let colorBorderOrange = CGColor(red: 255/255, green: 110/255, blue: 18/255, alpha: 0.8)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = colorBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = colorBackground
        navigationItem.title = "SIGN IN"
        
        var characterIndex = 0.0
        nameLabel.text = ""
        let name = "Lovely Animals"
        
        for letter in name {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { timer in
                self.nameLabel.text?.append(letter)
            }
            characterIndex += 1
        }
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.init(name: "chalkduster", size: 20)
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.textColor = colorOrange
        view.addSubview(nameLabel)
        
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
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.tintColor = colorOrange
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.addTarget(self, action: #selector(goToMainPageVC), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.configuration = .plain()
        signUpButton.setTitleColor(colorOrange, for: .normal)
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.addTarget(self, action: #selector(goToSignUpVC), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
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
            
            signInButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 40),
            signInButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            signInButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            signUpButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            signUpButton.widthAnchor.constraint(greaterThanOrEqualTo: signUpButton.widthAnchor),
            signUpButton.heightAnchor.constraint(greaterThanOrEqualToConstant: signUpButton.contentScaleFactor),
            signUpButton.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0.8)
        ])
    }
    
    @objc func goToMainPageVC() {
        if emailText.text != nil && passwordText.text != nil {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    Common.showAlert(title: "Error", message: error?.localizedDescription ?? "Check your email address and password", vc: self)
                } else {
                    self.performSegue(withIdentifier: "toMainPageVC", sender: nil)
                }
            }
        } else {
            Common.showAlert(title: "Error", message: "Check your email address and password", vc: self)
        }
    }
    
    @objc func goToSignUpVC() {
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
    }
    
}
