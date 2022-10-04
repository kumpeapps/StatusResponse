# StatusResponse

StatusResponse is a simple framework to assist in HTTP Status Response Codes.

## Installation with CocoaPods

```ruby
pod 'StatusResponse'
```

## Usage

```swift
import StatusResponse
```

Simply pass the status code to the HTTP_Status() function

```swift
let status = HTTP_Status(100)
let category = status.statusCategory // .Informational
let description = status.statusDescription // Continue
let success = status.isSuccess // False
```

```swift
let status = HTTP_Status(201)
let category = status.statusCategory // .Success
let description = status.statusDescription // OK
let success = status.isSuccess // True
```

```swift
let status = HTTP_Status(301)
let category = status.statusCategory // .Redirection
let description = status.statusDescription // Moved Permanently
let success = status.isSuccess // False
```

```swift
let status = HTTP_Status(401)
let category = status.statusCategory // .ClientError
let description = status.statusDescription // Unauthorized
let success = status.isSuccess // False
```

```swift
let status = HTTP_Status(500)
let category = status.statusCategory // .ServerError
let description = status.statusDescription // Internal Server Error
let success = status.isSuccess // False
```

If you have custom error messages you wish to log or display to the user you can set errorMessages. By default, the default error message is the status description.

```swift
let errorMessages = [401: "Your username/password are incorrect", 423: "Your account is locked"]
StatusResponse.setErrorMessages(errorMessages)

let status = HTTP_Status(401)
let error = status.errorMessage // Your username/password are incorrect

let status2 = HTTP_Status(500)
let error2 = status.errorMessage // Internal Server Error
```

You can change the default error message by setting StatusResponse.setDefaultErrorMessage().

```swift
let errorMessages = [401: "Your username/password are incorrect", 423: "Your account is locked"]
StatusResponse.setErrorMessages(errorMessages)
StatusResponse.setDefaultErrorMessage("An Unknown Error Occurred")

let status = HTTP_Status(401)
let error = status.errorMessage // Your username/password are incorrect

let status2 = HTTP_Status(500)
let error2 = status.errorMessage // An Unknown Error Occurred
```

