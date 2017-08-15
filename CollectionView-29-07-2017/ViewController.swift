//
//  ViewController.swift
//  CollectionView-29-07-2017
//
//  Created by Soeng Saravit on 7/29/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoCategories = PhotoCategory.fetchPhoto()
    
    let leftandrightPadding:CGFloat = 2.0
    let numberOfItemsPerRow:CGFloat = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionWidth = self.collectionView.bounds.size.width
        let itemWidth = (collectionWidth - leftandrightPadding) / numberOfItemsPerRow
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        cell.imageName = imageNames[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PhotoHeader", for: indexPath) as! PhotoHeaderCollectionReusableView
        let category = photoCategories[indexPath.section]
        header.category = category
        
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = photoCategories[indexPath.section]
        let imageName = category.imageNames[indexPath.item]
        let image = UIImage(named: imageName)
        
        self.performSegue(withIdentifier: "ShowPhoto", sender: image)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto" {
            let dest = segue.destination as! PhotoDetailViewController
            dest.image = sender as? UIImage
        }
    }
    
}

