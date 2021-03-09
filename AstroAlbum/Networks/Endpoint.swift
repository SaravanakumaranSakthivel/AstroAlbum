//
//  Endpoint.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 07/03/21.
//


import Foundation

/*
    This is an basic structure to define a Endpoint.
 */

struct EndPoint {
    let path: String
    let queryItems: [URLQueryItem]
}


extension EndPoint {
    
    static func getPicOfTheDay() -> EndPoint {
        return EndPoint(path: Constants.apodPath,
                        queryItems: [URLQueryItem(name:"api_key", value:Constants.apiKey)])
    }
    
    static func getEndPointForTheDateRange(startDate:String, endDate: String) -> EndPoint {
        return EndPoint(path: Constants.apodPath,
                        queryItems: [URLQueryItem(name:"api_key", value:Constants.apiKey),
                                     URLQueryItem(name: "start_date", value: startDate),
                                    URLQueryItem(name: "end_date", value: endDate),
                                    URLQueryItem(name: "thumbs", value: "true")])
    }
}

//https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2021-02-15&end_date=2021-03-01&thumbs=true


extension EndPoint {
    // We still have to keep 'url' as an optional, since we're
    // dealing with dynamic components that could be invalid.
    var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.httpSchema
        components.host = Constants.baseURL
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
