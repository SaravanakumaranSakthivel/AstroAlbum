//
//  AstroPOD_Model.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 07/03/21.
//

import Foundation
import UIKit

class AstroAlbumCellViewModel {
    internal var image: UIImage?
    internal let title: String?
    internal let imageURL: String?
    internal let explanation: String?
    internal let mediaType: MediaType?
    internal let thumbURL: String?
    
    init(_ astroAlbumModel: AstroAlbumModel) {
        self.title = astroAlbumModel.title
        self.imageURL = astroAlbumModel.url
        self.explanation = astroAlbumModel.explanation
        self.thumbURL = astroAlbumModel.thumbnail_url
        self.image = nil
        
        guard let mediaType = astroAlbumModel.media_type,
              mediaType == "image" else {
            self.mediaType = .video
            return
        }
        self.mediaType = .image
    }
    
    internal func downloadImage( handler: @escaping() -> () ) {
        // Check media type is .image then download image from imageurl
        // If the media type is not .image then it should be video type, then set thumbURL as imageUrl.
        var imageUrl: String?
        if self.mediaType == .image {
            imageUrl = self.imageURL
        }else {
            imageUrl = self.thumbURL
        }
        
        // Donwload image from the image url
        if let imageURL = imageUrl {
            NetworkHelper.downloadImage(for: imageURL, handler: {image, error in
                if error != nil {
                    print("Error in downloading image")
                    return
                }
                self.image = image
                handler()
            })
        }
        
    }
    
}


enum MediaType {
    case image
    case video
}
