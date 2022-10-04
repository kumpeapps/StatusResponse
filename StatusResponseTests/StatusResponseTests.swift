//
//  StatusResponseTests.swift
//  StatusResponseTests
//
//  Created by Justin Kumpe on 10/3/22.
//

import XCTest
@testable import StatusResponse

final class StatusResponseTests: XCTestCase {
    
    let ok = 200
    let created = 201
    let forbidden = 403
    let methodNotAllowed = 405
    let internalServerError = 500

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testSuccess() throws {
        XCTAssertTrue(HTTP_Status(ok).statusCategory == .Success)
        XCTAssertTrue(HTTP_Status(ok).isSuccess)
        XCTAssertTrue(HTTP_Status(created).isSuccess)
        XCTAssertFalse(HTTP_Status(forbidden).isSuccess)
        XCTAssertFalse(HTTP_Status(methodNotAllowed).isSuccess)
        XCTAssertFalse(HTTP_Status(internalServerError).isSuccess)
        XCTAssertEqual(HTTP_Status(ok).statusDescription, "OK")
        XCTAssertEqual(HTTP_Status(created).statusDescription, "Created")
    }

    func testClientError() throws {
        XCTAssertFalse(HTTP_Status(ok).statusCategory == .ClientError)
        XCTAssertFalse(HTTP_Status(created).statusCategory == .ClientError)
        XCTAssertTrue(HTTP_Status(forbidden).statusCategory == .ClientError)
        XCTAssertTrue(HTTP_Status(methodNotAllowed).statusCategory == .ClientError)
        XCTAssertFalse(HTTP_Status(internalServerError).statusCategory == .ClientError)
        XCTAssertEqual(HTTP_Status(forbidden).statusDescription, "Forbidden")
        XCTAssertEqual(HTTP_Status(methodNotAllowed).statusDescription, "Method Not Allowed")
    }

    func testServerError() throws {
        XCTAssertFalse(HTTP_Status(ok).statusCategory == .ServerError)
        XCTAssertFalse(HTTP_Status(created).statusCategory == .ServerError)
        XCTAssertFalse(HTTP_Status(forbidden).statusCategory == .ServerError)
        XCTAssertFalse(HTTP_Status(methodNotAllowed).statusCategory == .ServerError)
        XCTAssertTrue(HTTP_Status(internalServerError).statusCategory == .ServerError)
        XCTAssertEqual(HTTP_Status(internalServerError).statusDescription, "Internal Server Error")
    }

}
