//
//  HeaderCell.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 21/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class HeaderCell: BaseTableViewCell {
    
    
    var restaurant: Restaurant? {
        didSet {
            guard let restaurant = restaurant else { return }
            guard let urlString = restaurant.image else { return }
            
            // Kingfisher helps handle asyncchronous image downloding and caching. This saves time instead of having to handle this by yourself.
            let url = URL(string: urlString)
            let placeholder = UIImage(named: "placeholder")
            mainImageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setupViews() {
        
        addSubview(mainImageView)
        mainImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, widthConstant: frame.width, heightConstant: 200)
        
    }
}
