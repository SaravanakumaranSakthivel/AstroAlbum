//
//  NetworkHelper.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 07/03/21.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, UIImage>()

struct NetworkHelper {
    
    
    internal static func getAstroPictureOfTheDay(handler: @escaping(AstroAlbumModel?, Error?) ->Void) {
        let endPoint = EndPoint.getPicOfTheDay()
        
        AstroAlbumRequest.getAPOD(endPoint, then: { astroPOD, error in
            handler(astroPOD, error)
        })
    }
    
    internal static func getAstroAlbumForTheDateRange(startDate:String,
                                                      endDate: String,
                                                      handler:@escaping([AstroAlbumModel]?, Error?) -> Void) {
        let endpoint = EndPoint.getEndPointForTheDateRange(startDate: startDate, endDate: endDate)
        AstroAlbumRequest.getAstroAlbumFortheRange(endpoint, then: { response, error in
            handler(response, error)
            
        })
        
    }
    
    
    internal static func downloadImage(for imageUrl: String,
                                       handler: @escaping(UIImage?, Error?) -> Void) {
        
        if let image = imageCache.object(forKey: imageUrl as AnyObject) {
            handler(image, nil)
        } else {
            
            guard let url = URL(string: imageUrl) else {
                return
            }
            
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                
                if error != nil {
                    handler(nil, error)
                }
                if let data = data,
                   let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: imageUrl as AnyObject)
                    handler(image, nil)
                }
                
            }).resume()
        }
        
    }
    
}


/*
    This is an enum to group all network error and json parsing error.
    - invalidURL - indicates the constructed URL is not correct
    - serverError - This indicates the error return by server and it all also carries error paramter.
    - noData - Service call happened and for some reason if data is not present this type will be returned.
    - parsingError - If there is an error occured while parsing this will be returned
    
    Improvements : We can define other errors and seperate networks errors as different enum and parser errors as another enum group to give a clarity on what is realy failing.
 */
public enum NetworkError: Error {
    case invalidURL
    case serverError(error: Error?)
    case noData
    case parsingError
}
