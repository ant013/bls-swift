**Note**: this framework doesn't provide a way to derive bls secret key and verify method
Copied and changed from "https://github.com/MyEtherWallet"
## bls-swift

bls-swift provides convenient way to integrate https://github.com/herumi/bls-go-binary

## Requirements
Good mood

## Features
- Easy to use
- Precompiled sources
- Safe to use with app extensions

## Installation
### Swift Package Manager

You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:

```swift
.package(url: "https://github.com/ant013/bls-swift.git", .upToNextMajor(from: "1.0.0"))
```

### XCFramework

`XCFrameworks` require Xcode 11 or later and they can be integrated similarly to how we’re used to integrating the `.framework` format. Please use a script `bls_framework/build.sh` to generate binary `bls_framework.xcframework` archive that you can use as a dependency in Xcode or you can use precompiled one.

`bls_framework.xcframework` is a Release (Optimized) binary that offer best available Swift code performance.

## How to
```swift
import bls_framework
```

##### blsSecretKey
```swift
try BLSInterface.blsInit()

let serializedSecretKey = Data(hex: "455c0dc9fccb3395825d92a60d2672d69416be1c2578a87a7a3d3ced11ebb88d").bytes // [UInt8]

var secretKey = blsSecretKey.init()
blsSecretKeyDeserialize(&secretKey, &serializedSecretKey, numericCast(serializedSecretKey.count))
```

##### blsPublicKey
```swift
var publicKey = blsPublicKey.init()
blsGetPublicKey(&publicKey, &secretKey)
```

##### Eth2 Public Key
```swift
let PUBLIC_KEY_SIZE = 48
var publicKeyBytes = Data(count: PUBLIC_KEY_SIZE).bytes // [UInt8]
blsPublicKeySerialize(&publicKeyBytes, PUBLIC_KEY_SIZE, &publicKey)

return Data(publicKeyBytes)
```

## Swift versions support

- Swift 5.0 and newer, branch [master](https://github.com/ant013/bls-swift/tree/master)

### License

MIT
