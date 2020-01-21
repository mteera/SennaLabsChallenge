//
//  CustomTableViewCell.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var restaurant: Restaurant? {
        didSet {
            guard let restaurant = restaurant else { return }
            titleLabel.text = restaurant.name
        }
    }
    
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        separatorInset = UIEdgeInsets(top: 0, left: self.bounds.size.width, bottom: 0, right: 0)
        selectionStyle = .none
        
        
        let viewShadow = UIView()
        viewShadow.backgroundColor = UIColor.yellow
        viewShadow.layer.shadowColor = UIColor.black.cgColor
        viewShadow.layer.shadowOpacity = 0.25
        viewShadow.layer.shadowOffset = CGSize(width: 0, height: 8)
        viewShadow.layer.shadowRadius = 24
        viewShadow.layer.cornerRadius = 10
        
        addSubview(viewShadow)
        
        viewShadow.addSubview(cardView)
        
        cardView.addSubview(mainImageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descriptionLabel)
        
        cardView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 30, rightConstant: 15)
        
        mainImageView.anchor(cardView.topAnchor, left: cardView.leftAnchor, bottom: nil, right: cardView.rightAnchor, widthConstant: cardView.frame.width, heightConstant: 200)
        
        
        titleLabel.anchor(mainImageView.bottomAnchor, left: mainImageView.leftAnchor, bottom: nil, right: mainImageView.rightAnchor, topConstant: 15, leftConstant: 15)
        
        
        descriptionLabel.anchor(titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: cardView.bottomAnchor, right: mainImageView.rightAnchor, topConstant: 5, bottomConstant: 15)

        
       
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
