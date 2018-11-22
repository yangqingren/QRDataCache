# QRDataCache

[![CI Status](https://img.shields.io/travis/yangqingren/QRDataCache.svg?style=flat)](https://travis-ci.org/yangqingren/QRDataCache)
[![Version](https://img.shields.io/cocoapods/v/QRDataCache.svg?style=flat)](https://cocoapods.org/pods/QRDataCache)
[![License](https://img.shields.io/cocoapods/l/QRDataCache.svg?style=flat)](https://cocoapods.org/pods/QRDataCache)
[![Platform](https://img.shields.io/cocoapods/p/QRDataCache.svg?style=flat)](https://cocoapods.org/pods/QRDataCache)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

    /**
     存储
     */
    + (BOOL)saveDataToDB:(id)model key:(NSString *)key;

    /**
     读取
     */
    + (id)getDataByClass:(Class)className key:(NSString *)key;

    /**
     删除数据
     */
    + (BOOL)deleteDataWithKey:(NSString *)key;

    /**
     删除所有数据
     */
    + (BOOL)deleteAllData;

## Installation

QRDataCache is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QRDataCache'
```

## Author

yangqingren, 564008993@qq.com

## License

QRDataCache is available under the MIT license. See the LICENSE file for more info.
