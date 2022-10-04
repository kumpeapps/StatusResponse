//
//  StatusResponse.swift
//  StatusResponse
//
//  Created by Justin Kumpe on 10/3/22.
//

import Foundation

public class StatusResponse {
    static var errorMessages: [Int:String] = [:]
    public func setErrorMessages(_ errorMessages: [Int:String]) {
        let defaultMessage = StatusResponse.errorMessages[0]
        StatusResponse.errorMessages = errorMessages
        StatusResponse.errorMessages[0] = defaultMessage
    }
    public func setDefaultErrorMessage(_ message: String?) {
        StatusResponse.errorMessages[0] = message
    }
    public func HTTP_Status(_ statusCode: Int) -> HTTP_Status {
        return HTTP_Status(statusCode)
    }
}
