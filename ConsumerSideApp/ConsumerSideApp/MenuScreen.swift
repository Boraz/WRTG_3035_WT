//
//  MenuScreen.swift
//  ConsumerSideApp
//
//  Created by Frederik Lohner on 9/Mar/16.
//  Copyright © 2016 Writing. All rights reserved.
//

import UIKit
import SnapKit

class MenuScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let gradientLayer = CAGradientLayer()
    private let menuTableView = UITableView()
    
    override func viewDidLoad() {
        print("loaded")
        gradientLayer.frame = self.view.bounds
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.registerClass(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        menuTableView.tableFooterView = UIView()
        
        let color1 = UIColor(red:0.19, green:0.25, blue:0.35, alpha:1.0).CGColor as CGColorRef
        let color2 = UIColor(red:0.15, green:0.21, blue:0.29, alpha:1.0).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.addSublayer(gradientLayer)
        self.menuTableView.layer.addSublayer(gradientLayer)
        menuTableView.backgroundColor = UIColor(red:0.19, green:0.25, blue:0.35, alpha:1.0)
        self.view.addSubview(menuTableView)
        menuTableView.snp_makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(self.view)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {        return generateMenuCell(menuTableView, indexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}