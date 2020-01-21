//
//  MenuCell.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 21/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class MenuCell: BaseTableViewCell {
    
    
    
    var menu: Menu? {
        didSet {
            guard let menu = menu else { return }
            
            let price = Double(menu.price)
            
            titleLabel.text = menu.name
            descriptionLabel.text = "\(String(format: "%.0f", price!))฿"
            // Kingfisher helps handle asyncchronous image downloding and caching. This saves time instead of having to handle this by yourself.
            let url = URL(string: menu.imageUrl)
            let placeholder = UIImage(named: "placeholder")
            mainImageView.kf.setImage(with: url, placeholder: placeholder)
            

            
        }
    }
    
    
    
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "45฿"

        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override func setupViews() {
        
        addSubview(mainImageView)
        
        mainImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil,leftConstant: 15,  widthConstant: 100, heightConstant: 75)
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.spacing = 4
        stackView.axis = .vertical
        
        addSubview(stackView)
        
        stackView.anchor(mainImageView.topAnchor, left: mainImageView.rightAnchor, bottom: nil, right: rightAnchor, leftConstant: 8, rightConstant: 15)
        
    }
}
