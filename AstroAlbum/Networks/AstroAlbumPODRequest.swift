//
//  AstroAlbumPODRequest.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 07/03/21.
//

import Foundation


internal struct AstroAlbumRequest {
    
    internal static func getAPOD(_ endPoint: EndPoint, then handler: @escaping(AstroAlbumModel?, NetworkError?) -> Void) {
        guard let url = endPoint.url else {
            return handler(nil, .invalidURL )
        }

        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error = error {
                handler(nil, .serverError(error: error))
            }

            guard let data = data else {
                handler(nil, .noData)
                return
            }

            do {
                let picOfTheDay = try JSONDecoder().decode(AstroAlbumModel.self, from: data)
                handler(picOfTheDay, nil)
            } catch let parsingError {
                print("Error in parsing --- \(parsingError)")
                handler(nil, .parsingError)
            }
        }).resume()
    }
    
    
    internal static func getAstroAlbumFortheRange(_ endpoint: EndPoint, then handler: @escaping([AstroAlbumModel]?, NetworkError?) -> Void) {
       
        guard let url = endpoint.url else {
            return handler(nil, .invalidURL )
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error = error {
                handler(nil, .serverError(error: error))
            }
            
            guard let data = data else {
                handler(nil, .noData)
                return
            }
            
            do {
                let albumsArray = try JSONDecoder().decode([AstroAlbumModel].self, from: data)
                handler(albumsArray, nil)
            } catch {
                handler(nil, .parsingError)
            }
        }).resume()
    }
}
