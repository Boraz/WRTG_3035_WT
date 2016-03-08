//
//  ViewController.swift
//  ConsumerSideApp
//
//  Created by Frederik Lohner on 8/Mar/16.
//  Copyright © 2016 Writing. All rights reserved.
//

import UIKit
import SnapKit

class LoginScreen: UIViewController {
    private var usernameEntry = UITextField()
    private var passwordEntry = UITextField()
    private var loginButton = UIButton()
    private var loginLabel = UILabel()
    private var passwordLabel = UILabel()
    
    override func viewDidLoad() {
        self.view.addSubview(loginLabel)
        self.view.addSubview(usernameEntry)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordEntry)
        self.view.addSubview(loginButton)
        
        usernameEntry.borderStyle = .RoundedRect
        usernameEntry.placeholder = "CU Identikey"
        
        passwordEntry.borderStyle = .RoundedRect
        passwordEntry.secureTextEntry = true
        passwordEntry.placeholder = "Identikey password"
        
        
        loginLabel.text = "Login"
        passwordLabel.text = "Password"
        
        loginButton.backgroundColor = UIColor.blackColor()
        
        loginLabel.snp_makeConstraints { (make) -> Void in
//            make.bottom.equalTo(usernameEntry.snp_top).offset(-5)
            make.centerX.equalTo(usernameEntry)
            make.centerY.equalTo(self.view).offset(-100)
        }
        
        usernameEntry.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(loginLabel.snp_bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        passwordLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(usernameEntry.snp_bottom).offset(5)
            make.centerX.equalTo(usernameEntry)
        }
        passwordEntry.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(passwordLabel.snp_bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        loginButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(passwordEntry.snp_bottom).offset(10)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(50)
        }
        self.title = "Login"
        self.navigationController?.navigationBar.backgroundColor = UIColor(red:0.18, green:0.19, blue:0.24, alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

