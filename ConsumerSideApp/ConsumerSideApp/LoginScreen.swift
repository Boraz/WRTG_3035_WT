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
    private var loginLabelTopBar = UIView()
    private var loginLabelMidBar = UIView()
    private var loginLabelBottomBar = UIView()
    private var passwordLabel = UILabel()
    private let gradientLayer = CAGradientLayer()
    private let iconImage = UIImageView()
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor(red:0.19, green:0.25, blue:0.35, alpha:1.0).CGColor as CGColorRef
        let color2 = UIColor(red:0.15, green:0.21, blue:0.29, alpha:1.0).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.addSublayer(gradientLayer)
        
        self.view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) -> Void in
            make.top.right.bottom.left.equalTo(self.view)
        }
        scrollView.addSubview(containerView)
        containerView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view)
            make.centerX.equalTo(scrollView)
        }
        containerView.addSubview(loginLabelTopBar)
        containerView.addSubview(loginLabelMidBar)
        containerView.addSubview(loginLabelBottomBar)
        containerView.addSubview(usernameEntry)
        containerView.addSubview(passwordLabel)
        containerView.addSubview(passwordEntry)
        containerView.addSubview(loginButton)
        containerView.addSubview(iconImage)
        
        
        iconImage.image = UIImage(named: "Icon")
        iconImage.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(213)
            make.width.equalTo(300)
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).offset(100)
        }
//        iconImage.hidden = true
        
        usernameEntry.attributedPlaceholder  = NSAttributedString(string:"CU Identikey",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)])
        usernameEntry.textColor = UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)
        
        passwordEntry.secureTextEntry = true
        passwordEntry.attributedPlaceholder  = NSAttributedString(string:"********",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)])
        passwordEntry.textColor = UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)
        
        loginLabelTopBar.backgroundColor = UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)
        loginLabelTopBar.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(usernameEntry)
            make.centerY.equalTo(containerView).offset(70)
            make.height.equalTo(1)
            make.width.equalTo(250)
        }
        
        usernameEntry.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containerView)
            make.top.equalTo(loginLabelTopBar.snp_bottom).offset(0)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        loginLabelMidBar.backgroundColor = UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)
        loginLabelMidBar.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(usernameEntry)
            make.top.equalTo(usernameEntry.snp_bottom)
            make.height.equalTo(1)
            make.width.equalTo(250)
        }
        passwordLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(usernameEntry.snp_bottom).offset(5)
            make.centerX.equalTo(usernameEntry)
        }
        passwordEntry.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containerView)
            make.top.equalTo(passwordLabel.snp_bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        loginLabelBottomBar.backgroundColor = UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)
        loginLabelBottomBar.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(usernameEntry)
            make.top.equalTo(passwordEntry.snp_bottom)
            make.height.equalTo(1)
            make.width.equalTo(250)
        }
        
        loginButton.backgroundColor = UIColor(red:0.88, green:0.26, blue:0.26, alpha:1.0)
        loginButton.backgroundColor = UIColor.whiteColor()
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        loginButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(passwordEntry.snp_bottom).offset(10)
            make.centerX.equalTo(containerView)
            make.height.equalTo(50)
            make.left.right.equalTo(loginLabelBottomBar)
        }
        self.navigationController?.navigationBar.hidden = true
    }

}

