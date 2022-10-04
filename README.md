# StatusResponse

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2ae00cd002014afdafe971418097d92e)](https://app.codacy.com/gh/kumpeapps/StatusResponse?utm_source=github.com&utm_medium=referral&utm_content=kumpeapps/StatusResponse&utm_campaign=Badge_Grade_Settings)

StatusResponse is a simple framework to assist in HTTP Status Response Codes.

## Installation with CocoaPods

```ruby
pod 'StatusResponse'
```

## Usage

```swift
import StatusResponse
```

Simply pass the status code to the HTTPStatus() function

```swift
let status = HTTPStatus(100)
let category = status.statusCategory // .informational
let description = status.statusDescription // Continue
let success = status.isSuccess // False
```

```swift
let status = HTTPStatus(201)
let category = status.statusCategory // .success
let description = status.statusDescription // OK
let success = status.isSuccess // True
```

```swift
let status = HTTPStatus(301)
let category = status.statusCategory // .redirection
let description = status.statusDescription // Moved Permanently
let success = status.isSuccess // False
```

```swift
let status = HTTPStatus(401)
let category = status.statusCategory // .clientError
let description = status.statusDescription // Unauthorized
let success = status.isSuccess // False
```

```swift
let status = HTTPStatus(500)
let category = status.statusCategory // .serverError
let description = status.statusDescription // Internal Server Error
let success = status.isSuccess // False
```

If you have custom error messages you wish to log or display to the user you can set errorMessages. By default, the default error message is the status description.

```swift
let errorMessages = [401: "Your username/password are incorrect", 423: "Your account is locked"]
StatusResponse.setErrorMessages(errorMessages)

let status = HTTPStatus(401)
let error = status.errorMessage // Your username/password are incorrect

let status2 = HTTPStatus(500)
let error2 = status.errorMessage // Internal Server Error
```

You can change the default error message by setting StatusResponse.setDefaultErrorMessage().

```swift
let errorMessages = [401: "Your username/password are incorrect", 423: "Your account is locked"]
StatusResponse.setErrorMessages(errorMessages)
StatusResponse.setDefaultErrorMessage("An Unknown Error Occurred")

let status = HTTPStatus(401)
let error = status.errorMessage // Your username/password are incorrect

let status2 = HTTPStatus(500)
let error2 = status.errorMessage // An Unknown Error Occurred
```
