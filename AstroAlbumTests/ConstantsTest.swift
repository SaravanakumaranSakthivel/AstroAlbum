//
//  ConstantsTest.swift
//  AstroAlbumTests
//
//  Created by SaravanaKumaran Sakthivel on 10/03/21.
//

import XCTest

class ConstantsTest: XCTestCase {

    func checkHttpSchema () {
        XCTAssertEqual(Constants.httpSchema, "https", "Http Schema should be https.")
    }
    
    func checkBaseURL () {
        XCTAssertEqual(Constants.baseURL, "api.nasa.gov", "Base URL for the API calls are not mathing.")
    }
    
    func checkAppToken() {
        XCTAssertEqual(Constants.apiKey, "qhzRmaELNDmz8PyuwUBf6hHIn3FC5JeIKLafwaPw" , "Api token is not matching.")
    }
    
    func checkAPODAPIPath() {
        XCTAssertEqual(Constants.apodPath, "/planetary/apod" , "APOD path is not matching")
    }
    

}
