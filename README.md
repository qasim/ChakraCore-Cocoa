# ChakraCore-Cocoa

This is a very rudimentary sample of building macOS applications that can run JavaScript through Microsoft's [ChakraCore](https://github.com/Microsoft/ChakraCore) engine.

## Requirements

ChakraCore itself has the following requirements:

```bash
$ brew install cmake icu4c
```

## Setup

Clone the repository and all of its submodules:

```bash
$ git clone --recursive https://github.com/qasim/ChakraCore-Cocoa.git && cd ChakraCore-Cocoa
```

Then, we can generate ChakraCore's Xcode project files:

```
$ ./ChakraCore/build.sh --xcode --icu=/usr/local/opt/icu4c/include
```

## Usage

Open the Xcode workspace:

```bash
$ open ChakraCore-Cocoa.xcworkspace
```

That's it! Build and run the ChakraCore-Cocoa target to see the sample file being executed by ChakraCore, and then printed to console, all inside a macOS app.

## What's next?

This can be used to build native macOS applications that may depend on a shared JS library. One could build a Cocoa wrapper on top of ChakraCore to create an alternative to Apple's [JavaScriptCore](https://developer.apple.com/reference/javascriptcore).

## What about iOS?

At the time of writing, ChakraCore cannot be built for iOS targets yet ([Microsoft/ChakraCore#1237](https://github.com/Microsoft/ChakraCore/issues/1237#issuecomment-243270937)).
