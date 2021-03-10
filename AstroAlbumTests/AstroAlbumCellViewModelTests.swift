//
//  AstroAlbumCellViewModelTests.swift
//  AstroAlbumTests
//
//  Created by SaravanaKumaran Sakthivel on 10/03/21.
//

import XCTest

class AstroAlbumCellViewModelTests: XCTestCase {
    var astorAlbumModel: AstroAlbumModel!

    override func setUp()  {
        self.astorAlbumModel = AstroAlbumModel(date: "08-03-2021", explanation: "Test Explanation", hdurl: "https://xyz.com/myimage",
                                          media_type: "image", service_version: "v1", title: "Picture of the day", url: "https://xyz.com/app", thumbnail_url: "https://xyz.com/thumbnail.jpg")
    }

    override func tearDown() {
        super.tearDown()
        self.astorAlbumModel = nil
    }

    func testAllProperties() {
        let cellViewModel = AstroAlbumCellViewModel(self.astorAlbumModel)
        XCTAssertEqual(cellViewModel.date, self.astorAlbumModel.date, "Date should match")
        XCTAssertEqual(cellViewModel.explanation, self.astorAlbumModel.explanation, "Explanation should match")
        XCTAssertEqual(cellViewModel.imageURL, self.astorAlbumModel.url, "Image URL should match")
        XCTAssertEqual(cellViewModel.thumbURL, self.astorAlbumModel.thumbnail_url, "Thumb URL should match ")

    }
    

}
