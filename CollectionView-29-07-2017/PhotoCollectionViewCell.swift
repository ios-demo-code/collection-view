//
//  PhotoCollectionViewCell.swift
//  CollectionView-29-07-2017
//
//  Created by Soeng Saravit on 7/29/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imageName:String? {
        didSet {
            self.photoImageView.image = UIImage(named: imageName!)
        }
    }
}
