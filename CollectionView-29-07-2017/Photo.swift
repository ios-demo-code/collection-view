//
//  Photo.swift
//  CollectionView-29-07-2017
//
//  Created by Soeng Saravit on 7/29/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import Foundation

struct PhotoCategory {
    var categoryImageName:String
    var title:String
    var imageNames:[String]
    
    static func fetchPhoto() -> [PhotoCategory]{
        var categories = [PhotoCategory]()
        let photoData = PhotoLibrary.downloadPhotoData()
        
        for (categoryName, dict) in photoData {
            if let dict = dict as? [String:Any] {
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String]{
                    let newCategory = PhotoCategory(categoryImageName: categoryImageName, title: categoryName, imageNames: imageNames)
                    categories.append(newCategory)
                }

            }
        }
        return categories
    }
}


class PhotoLibrary {
    
    class func downloadPhotoData() -> [String:Any]{
        return [
            "Family":[
                "categoryImageName":"family",
                "imageNames": PhotoLibrary.generateImage(categoryPrefix: "f", numberofImages: 9)
            ],
            "Foods":[
                "categoryImageName":"foods",
                "imageNames": PhotoLibrary.generateImage(categoryPrefix: "fo", numberofImages: 8)
            ],
            "Nature":[
                "categoryImageName":"nature",
                "imageNames": PhotoLibrary.generateImage(categoryPrefix: "n", numberofImages: 8)
            ],
            "Travel":[
                "categoryImageName":"travel",
                "imageNames": PhotoLibrary.generateImage(categoryPrefix: "t", numberofImages: 9)
            ]
        ]
    }
    
    private class func generateImage(categoryPrefix:String, numberofImages:Int) -> [String]{
        var imageNames:[String] = [String]()
        
        for i in 1...numberofImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
}
