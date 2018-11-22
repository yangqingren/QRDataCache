//
//  QRDataCache.h
//  Pods-QRDataCache_Example
//
//  Created by 杨庆人 on 2018/11/22.
//

#import <Foundation/Foundation.h>
@class QRDataCacheModel;

@interface QRDataCache : NSObject

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

@end

@interface QRDataCacheModel : NSObject

@property (nonatomic, copy) NSString *key;

@property (nonatomic, strong) NSObject *model;

@end
