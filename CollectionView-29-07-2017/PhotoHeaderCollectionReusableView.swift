//
//  PhotoHeaderCollectionReusableView.swift
//  CollectionView-29-07-2017
//
//  Created by Soeng Saravit on 7/29/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class PhotoHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var categoryPhotoImageView: UIImageView!
        
    @IBOutlet weak var titleLabel: UILabel!
    
    var category:PhotoCategory! {
        didSet{
            self.categoryPhotoImageView.image = UIImage(named: category.categoryImageName)
            self.titleLabel.text = category.title
        }
    }
}
