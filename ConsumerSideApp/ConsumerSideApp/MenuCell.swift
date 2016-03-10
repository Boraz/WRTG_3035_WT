//
//  MenuCell.swift
//  ConsumerSideApp
//
//  Created by Frederik Lohner on 9/Mar/16.
//  Copyright © 2016 Writing. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    let teamIcon = UIImageView()
    let teamNameLabel = UILabel()
    let divGrupoLabel = UILabel()
    let nombreLigaLabel = UILabel()
    let separatorBar = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(teamIcon)
        self.addSubview(teamNameLabel)
        self.addSubview(divGrupoLabel)
        self.addSubview(nombreLigaLabel)
        self.addSubview(separatorBar)
        
        teamNameLabel.adjustsFontSizeToFitWidth = true
        divGrupoLabel.adjustsFontSizeToFitWidth = true
        nombreLigaLabel.adjustsFontSizeToFitWidth = true
        
        teamIcon.snp_makeConstraints(closure: { (make) -> Void in
            make.height.width.equalTo(120)
            make.left.top.equalTo(self).offset(8)
        })
        self.teamIcon.layer.cornerRadius = self.teamIcon.frame.size.width / 2
        self.teamIcon.clipsToBounds = true
        self.teamIcon.layer.shadowOffset = CGSizeMake(5.0, 5.0);
        self.teamIcon.layer.shadowRadius = 5;
        self.teamIcon.layer.shadowOpacity = 0.5;
        
        teamNameLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(teamIcon.snp_right).offset(16)
            make.centerY.equalTo(teamIcon)
            make.right.equalTo(self).offset(-8)
        }
        teamNameLabel.adjustsFontSizeToFitWidth = true
        teamNameLabel.font = UIFont.systemFontOfSize(50)
        
        separatorBar.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        separatorBar.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(1)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        teamIcon.layer.cornerRadius = teamIcon.bounds.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

func generateMenuCell(tableView: UITableView, indexPath: NSIndexPath) -> MenuCell {
    let menuCell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as? MenuCell ?? MenuCell(style: .Default, reuseIdentifier: "MenuCell")
    menuCell.backgroundColor = UIColor.whiteColor()
    menuCell.selectionStyle = .None
    switch indexPath.row {
    case 0:
        menuCell.teamIcon.image = UIImage(named: "Pizza")
        menuCell.teamNameLabel.text = "Pizza"
    case 1:
        menuCell.teamIcon.image = UIImage(named: "Calzone")
        menuCell.teamNameLabel.text = "Calzone"
    case 2:
        menuCell.teamIcon.image = UIImage(named: "BLT")
        menuCell.teamNameLabel.text = "Sandwich"
    case 3:
        menuCell.teamIcon.image = UIImage(named: "Smoothie")
        menuCell.teamNameLabel.text = "Smoothie"
    case 4:
        menuCell.teamIcon.image = UIImage(named: "RedBull")
        menuCell.teamNameLabel.text = "Red Bull"
    default:
        menuCell.teamIcon.image = UIImage(named: "Pizza")
        menuCell.teamNameLabel.text = "Pizza"
    }
    
    return menuCell
}