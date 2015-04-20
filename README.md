# Rosco
Native Mac OS X desktop music accessory written in Swift

![Rosco Desktop Image](http://i.imgur.com/0svAhU7.png)

Inspired by [Bowtie app](http://bowtieapp.com) and [Unnamed Theme](http://beautifulblood.deviantart.com/art/Unnamed-255040591).
Bowtie development stopped in early 2012 with a comment that it would be released on Github. While it has a great set of features I wanted to simplify the idea for my needs and introduce some new features.



### Features
- [x] Modern styling using [NSVisualEffectView](https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSVisualEffectView_Class/)
- [x] Light and Dark Vibrancy Themes
- [x] Spotify Scripting Bridge Support
- [ ] iTunes Scripting Bridge Support
- [ ] Mopidy Web Socket Support

### Requirements
* OS X 10.10 Yosemite
* Xcode 6.3 / Swift 1.2
* [Carthage](https://github.com/Carthage/Carthage)

### Install

Run in Xcode
1. Navigate to root directory in Terminal
2. Run `carthage update`
3. Run `open Rosco.xcodeproj`



To build and open from Terminal
1. Navigate to root directory
2. Run `carthage update`
3. Run `xcodebuild`
4. Run `open ./build/release/rosco.app`

### Contact

Evan Robertson
* http://github.com/evanrobertson
* evanjonr@gmail.com

### License

Rosco is available under the MIT License. See the LICENSE file for more details.
