//
//  AstroAlbumTests.swift
//  AstroAlbumTests
//
//  Created by SaravanaKumaran Sakthivel on 06/03/21.
//

import XCTest
@testable import AstroAlbum


class AstroAlbumModelTests: XCTestCase {

    
    override class func setUp() {

    }

    override class func tearDown() {

    }
    
    func testAstroModelObject() {
        let JSON = """
        {
            "copyright":"Yannick Akar","date":"2021-03-10","explanation":"Could Queen Calafia's mythical island exist in space? Perhaps not, but by chance the outline of this molecular space cloud echoes the outline of the state of California, USA. Our Sun has its home within the Milky Way's Orion Arm, only about 1,000 light-years from the California Nebula. Also known as NGC 1499, the classic emission nebula is around 100 light-years long. On the featured image, the most prominent glow of the California Nebula is the red light characteristic of hydrogen atoms recombining with long lost electrons, stripped away (ionized) by energetic starlight. The star most likely providing the energetic starlight that ionizes much of the nebular gas is the bright, hot, bluish Xi Persei just to the right of the nebula.  A regular target for astrophotographers, the California Nebula can be spotted with a wide-field telescope under a dark sky toward the constellation of Perseus, not far from the Pleiades.   New: APOD now available in Arabic from Syria","hdurl":"https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_3296.jpg","media_type":"image","service_version":"v1","title":"NGC 1499: The California Nebula","url":"https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_960.jpg"
        }
        """

        let jsonData = JSON.data(using: .utf8)!
        let albumModel: AstroAlbumModel = try! JSONDecoder().decode(AstroAlbumModel.self, from: jsonData)
        
        XCTAssertEqual(albumModel.date, "2021-03-10", "Date should match")
        XCTAssertEqual(albumModel.explanation, "Could Queen Calafia's mythical island exist in space? Perhaps not, but by chance the outline of this molecular space cloud echoes the outline of the state of California, USA. Our Sun has its home within the Milky Way's Orion Arm, only about 1,000 light-years from the California Nebula. Also known as NGC 1499, the classic emission nebula is around 100 light-years long. On the featured image, the most prominent glow of the California Nebula is the red light characteristic of hydrogen atoms recombining with long lost electrons, stripped away (ionized) by energetic starlight. The star most likely providing the energetic starlight that ionizes much of the nebular gas is the bright, hot, bluish Xi Persei just to the right of the nebula.  A regular target for astrophotographers, the California Nebula can be spotted with a wide-field telescope under a dark sky toward the constellation of Perseus, not far from the Pleiades.   New: APOD now available in Arabic from Syria", "Explanation should match")
        
        XCTAssertEqual(albumModel.url, "https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_960.jpg", "Image URL should match")
        XCTAssertEqual(albumModel.media_type, "image", "Media types are not matching")
        XCTAssertEqual(albumModel.hdurl, "https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_3296.jpg", "HD Image URL should match")
        XCTAssertEqual(albumModel.hdurl, "https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_3296.jpg", "HD Image URL should match")
        XCTAssertEqual(albumModel.title, "NGC 1499: The California Nebula", "Title should match")
        XCTAssertEqual(albumModel.service_version, "v1", "Service version is not matching")
    }

}
