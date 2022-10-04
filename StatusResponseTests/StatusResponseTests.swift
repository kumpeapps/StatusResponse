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
        XCTAssertTrue(HTTPStatus(ok).statusCategory == .success)
        XCTAssertTrue(HTTPStatus(ok).isSuccess)
        XCTAssertTrue(HTTPStatus(created).isSuccess)
        XCTAssertFalse(HTTPStatus(forbidden).isSuccess)
        XCTAssertFalse(HTTPStatus(methodNotAllowed).isSuccess)
        XCTAssertFalse(HTTPStatus(internalServerError).isSuccess)
        XCTAssertEqual(HTTPStatus(ok).statusDescription, "OK")
        XCTAssertEqual(HTTPStatus(created).statusDescription, "Created")
    }

    func testClientError() throws {
        XCTAssertFalse(HTTPStatus(ok).statusCategory == .clientError)
        XCTAssertFalse(HTTPStatus(created).statusCategory == .clientError)
        XCTAssertTrue(HTTPStatus(forbidden).statusCategory == .clientError)
        XCTAssertTrue(HTTPStatus(methodNotAllowed).statusCategory == .clientError)
        XCTAssertFalse(HTTPStatus(internalServerError).statusCategory == .clientError)
        XCTAssertEqual(HTTPStatus(forbidden).statusDescription, "Forbidden")
        XCTAssertEqual(HTTPStatus(methodNotAllowed).statusDescription, "Method Not Allowed")
    }

    func testServerError() throws {
        XCTAssertFalse(HTTPStatus(ok).statusCategory == .serverError)
        XCTAssertFalse(HTTPStatus(created).statusCategory == .serverError)
        XCTAssertFalse(HTTPStatus(forbidden).statusCategory == .serverError)
        XCTAssertFalse(HTTPStatus(methodNotAllowed).statusCategory == .serverError)
        XCTAssertTrue(HTTPStatus(internalServerError).statusCategory == .serverError)
        XCTAssertEqual(HTTPStatus(internalServerError).statusDescription, "Internal Server Error")
    }

}
