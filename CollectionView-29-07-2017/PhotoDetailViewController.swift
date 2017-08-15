//
//  PhotoDetailViewController.swift
//  CollectionView-29-07-2017
//
//  Created by Soeng Saravit on 7/29/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var image:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoImageView.image = image

        // Do any additional setup after loading the view.
    }


}
