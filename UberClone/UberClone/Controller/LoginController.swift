//
//  LoginController.swift
//  UberClone
//
//  Created by Gabriel Lucas Alves da Silva on 26/02/22.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - PropertiesSession
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
       
        return label
    }()
    
    // we turned it to a lazy var, bc we're changing the emailTextField and set it into the email container
    // so, that can not be a let variable
    private lazy var emailContainerView: UIView = {
        guard let image = UIImage(named: "ic_mail_outline_white_2x") else { return UIView()  }
        let view = UIView().inputContainerView(image: image, textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        guard let image = UIImage(named: "ic_lock_outline_white_2x") else { return UIView()  }
        let view = UIView().inputContainerView(image: image, textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email",
                                       isSecureTextEntry: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password",
                                       isSecureTextEntry: true)
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .mainBlueTint
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account   ",
                                                        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                                                               NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    //MARK: - LifecycleSession

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - SelectorsSession
    
    @objc func handleShowSignUp() {
        print("Attemping to push controller...")
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - HelperFunctionsSession
    
    private func configureUI() {
        configureNavigationrBar()
        
        view.backgroundColor = .backgroundColor
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 50,
                     paddingLeft: 16,
                     paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
    
    private func configureNavigationrBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}
