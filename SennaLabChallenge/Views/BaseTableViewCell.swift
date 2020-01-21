//
//  BaseTableViewCell.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 21/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func setupViews() {
        
    }
    
    
}
