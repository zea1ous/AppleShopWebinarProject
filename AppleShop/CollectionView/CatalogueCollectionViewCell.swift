//
//  CatalogueCollectionViewCell.swift
//  AppleShop
//
//  Created by Alex Kolovatov on 24.01.2020.
//  Copyright © 2020 RagnaCode. All rights reserved.
//

import UIKit

final class CatalogueCollectionViewCell: UICollectionViewCell {
    
    var device: Device? {
        didSet {
            guard let device = device else { return }
            nameLabel.text = device.name
            priceLabel.text = "\(device.price) $"
            iconImageView.image = device.image
        }
    }
    
    private let imageSize: CGSize = .init(width: 100, height: 200)
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .textTitleBlue
        label.textAlignment = .right
        label.numberOfLines = 2
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white

//        contentView.addSubview(containerView)
//        containerView.layer.cornerRadius = 10
//        containerView.layer.masksToBounds = true
        
        [nameLabel, iconImageView, priceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.frame = CGRect(
            x: (frame.width - imageSize.width) / 2,
            y: 10,
            width: imageSize.width,
            height: imageSize.height
        )
        
        nameLabel.sizeToFit()
        nameLabel.frame = CGRect(
            x: (frame.width - nameLabel.frame.width) / 2,
            y: iconImageView.frame.maxY + 10,
            width: nameLabel.frame.width,
            height: nameLabel.frame.height
        )
        
        priceLabel.sizeToFit()
        priceLabel.frame = CGRect(
            x: (frame.width - priceLabel.frame.width) / 2,
            y: nameLabel.frame.maxY + 10,
            width: priceLabel.frame.width,
            height: priceLabel.frame.height
        )
    }
    
}
