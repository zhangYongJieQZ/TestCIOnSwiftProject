//
//  TestCICDOnSwiftTests.swift
//  TestCICDOnSwiftTests
//
//  Created by 张永杰 on 2021/2/20.
//

import XCTest
@testable import TestCICDOnSwift

class TestCICDOnSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_address_codeable() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let address = Address(street: "street", city: "city", state: "state", country: "country", zip: "10086")
        let encodeStr = try! address.string()
        let decodeAddress = try! JsonHelper.decode(Address.self, from: encodeStr)
        
        XCTAssertEqual(address.street, decodeAddress.street)
        XCTAssertEqual(address.city, decodeAddress.city)
        XCTAssertEqual(address.state, decodeAddress.state)
        XCTAssertEqual(address.country, decodeAddress.country)
        XCTAssertEqual(address.zip, decodeAddress.zip)

    }

    func test_error() throws {
            XCTAssertEqual(1, 0)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
