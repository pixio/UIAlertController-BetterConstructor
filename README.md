# UIAlertController-BetterConstructor

[![Version](https://img.shields.io/cocoapods/v/UIAlertController-BetterConstructor.svg?style=flat)](http://cocoapods.org/pods/UIAlertController-BetterConstructor)
[![License](https://img.shields.io/cocoapods/l/UIAlertController-BetterConstructor.svg?style=flat)](http://cocoapods.org/pods/UIAlertController-BetterConstructor)
[![Platform](https://img.shields.io/cocoapods/p/UIAlertController-BetterConstructor.svg?style=flat)](http://cocoapods.org/pods/UIAlertController-BetterConstructor)

## TL;DR
Turn this:

```objective-c
UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Not Nice" message:@"So many declarations and lines of code. Why do I have to remember all these types?" preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"Something Else" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"Do something else.");
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Something" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Do something.");
    }]];
    [self presentViewController:ac animated:true completion:^{
        
    }];
```

into this:

```objective-c
UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Easy" message:@"One method. That's all." style:UIAlertControllerStyleAlert cancelButtonTitle:@"Something Else" cancelButtonBlock:^(UIAlertAction *action) {
        NSLog(@"Do something else.");
} destructiveButtonTitle:nil destructiveButtonBlock:nil otherButtonTitlesAndBlocks:@"Something", ^(UIAlertAction *action) {
        NSLog(@"Do something.");
}, nil];
[self presentViewController:ac animated:true completion:^{
    
}];
```

## Usage

Just import the header and use the class method to make Alerts and Sheets.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

UIAlertController-BetterConstructor is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "UIAlertController-BetterConstructor"
```

## Author

Daniel Blakemore, DanBlakemore@gmail.com

## License

UIAlertController-BetterConstructor is available under the MIT license. See the LICENSE file for more info.
