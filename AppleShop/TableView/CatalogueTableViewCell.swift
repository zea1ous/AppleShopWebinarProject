//
//  CatalogueTableViewCell.swift
//  AppleShop
//
//  Created by Alex Kolovatov on 24.01.2020.
//  Copyright © 2020 RagnaCode. All rights reserved.
//

import UIKit

final class CatalogueTableViewCell: UITableViewCell {
    
    private let imageHeight: CGFloat = 80
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .textTitleBlue
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.frame = CGRect(
            x: 16,
            y: (frame.height - imageHeight)/2,
            width: imageHeight,
            height: imageHeight
        )
        
        nameLabel.sizeToFit()
        nameLabel.frame = CGRect(
            x: iconImageView.frame.maxX + 10,
            y: (frame.height - nameLabel.frame.height)/2,
            width: nameLabel.frame.width,
            height: nameLabel.frame.height
        )
        
//        nameLabel.frame = CGRect(
//            x: iconImageView.frame.maxX + 10,
//            y: 0,
//            width: frame.width - 16 - 40 - 10,
//            height: frame.height
//        )
    }
    
    func configure(_ name: String, image: UIImage) {
        nameLabel.text = name
        iconImageView.image = image
    }
}
