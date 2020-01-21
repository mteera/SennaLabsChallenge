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


class MetaCell: BaseTableViewCell {
    
    
    var restaurant: Restaurant? {
        didSet {
            guard let restaurant = restaurant else { return }
            titleLabel.text = restaurant.name
            descriptionLabel.text = restaurant.kind
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "45฿"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    
    override func setupViews() {
        

        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        
        stackView.anchor(topAnchor, bottom: bottomAnchor, topConstant: 15, bottomConstant: 15)
        stackView.centerInSuperview()
        
    }
}
