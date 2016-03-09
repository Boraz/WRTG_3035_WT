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
        
//        teamNameLabel.font = equipoNameFont
//        divGrupoLabel.font = equipoDivGrupoFont
//        nombreLigaLabel.font = equipoLigaFont
        
        teamNameLabel.adjustsFontSizeToFitWidth = true
        divGrupoLabel.adjustsFontSizeToFitWidth = true
        nombreLigaLabel.adjustsFontSizeToFitWidth = true
        
        teamIcon.snp_makeConstraints(closure: { (make) -> Void in
            make.height.width.equalTo(40)
            make.left.top.equalTo(self).offset(8)
        })
        
        teamNameLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(teamIcon.snp_right).offset(8)
            make.top.equalTo(teamIcon)
            make.right.equalTo(self).offset(-8)
        }
        
        separatorBar.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
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
    
    menuCell.teamNameLabel.text = "test"
    return menuCell
}