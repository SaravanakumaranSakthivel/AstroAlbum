//
//  AstroPOD_Model.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 07/03/21.
//

import Foundation
import UIKit

struct AstroPOD_Model {
    internal var image: UIImage?
    internal let title: String?
    internal let imageURL: String?
    internal let explanation: String?
    internal let mediaType: MediaType?
    
    init(_ astroAlbumModel: AstroAlbumModel) {
        self.title = astroAlbumModel.title
        self.imageURL = astroAlbumModel.url
        self.explanation = astroAlbumModel.explanation
        self.image = nil
        
        guard let mediaType = astroAlbumModel.media_type,
              mediaType == "image" else {
            self.mediaType = .video
            return
        }
        self.mediaType = .image
    }
    
    mutating func downloadImage() {
        // Check media type is .image
        if self.mediaType == .image,
           let imageUrl = self.imageURL {
            
            
        } else {
            self.image = nil
        }
        
    }
    
}


enum MediaType {
    case image
    case video
}
