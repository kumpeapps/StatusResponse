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

