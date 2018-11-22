
//
//  QRDataCache.m
//  Pods-QRDataCache_Example
//
//  Created by 杨庆人 on 2018/11/22.
//

#import "QRDataCache.h"
#import <LKDBHelper/LKDBHelper.h>

NSString *const QRDBKey = @"key";

@implementation QRDataCache

/**
 存储
 */
+ (BOOL)saveDataToDB:(id)model key:(NSString *)key {
    
    @synchronized([QRDataCacheModel getUsingLKDBHelper]) {
        
        QRDataCacheModel *baseModel = [[QRDataCacheModel alloc] init];
        baseModel.model = model;
        baseModel.key = key;
        
        NSMutableArray *array = [QRDataCacheModel searchWithWhere:@{QRDBKey:key} orderBy:nil offset:0 count:100];
        if (array && array.count) {
            // 更新操作
            LKDBHelper *globalHelper = [QRDataCacheModel getUsingLKDBHelper];
            BOOL isUpdata = [globalHelper updateToDB:baseModel where:@{QRDBKey:key}];
            !isUpdata ? :NSLog(@"更新成功！ path=%@",[LKDBUtils getDocumentPath]);
            return isUpdata;
        }
        else {
            // 插入操作
            BOOL isSave = [baseModel saveToDB];
            !isSave ? :NSLog(@"插入成功！ path=%@",[LKDBUtils getDocumentPath]);
            return isSave;
        }
    }
}

/**
 读取
 */
+ (id)getDataByClass:(Class)className key:(NSString *)key {
    
    @synchronized([QRDataCacheModel getUsingLKDBHelper]) {
        
        NSMutableArray *array = [QRDataCacheModel searchWithWhere:@{QRDBKey:key} orderBy:nil offset:0 count:100];
        if (array && array.count) {
            QRDataCacheModel *data = array.lastObject;
            if ([data.model isKindOfClass:className]) {
                return data.model;
            }
            else if (!data.model) {
                NSLog(@"数据类型不支持，请存取 model、数组、字典！");
                return nil;
            }
            else if ([className isEqual:[NSMutableArray class]] && [data.model isKindOfClass:[NSArray class]]) {
                return [NSMutableArray arrayWithArray:(NSArray *)data.model];
            }
            else if ([className isEqual:[NSMutableDictionary class]] && [data.model isKindOfClass:[NSDictionary class]]) {
                return [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)data.model];
            }
            else {
                NSLog(@"数据类型不一致，请检查类型！(Model?NSArray? NSDictionary?)");
                return nil;
            }
        }
        else {
            return nil;
        }
    }
}

/**
 删除数据
 */
+ (BOOL)deleteDataWithKey:(NSString *)key {
    
    @synchronized([QRDataCacheModel getUsingLKDBHelper]) {
        
        LKDBHelper *globalHelper = [QRDataCacheModel getUsingLKDBHelper];
        BOOL isDelete = [globalHelper deleteWithClass:[QRDataCacheModel class] where:@{QRDBKey:key}];
        !isDelete ? :NSLog(@"删除成功！");
        return isDelete;
    }
}

/**
 删除所有数据
 */
+ (BOOL)deleteAllData {
    
    @synchronized([QRDataCacheModel getUsingLKDBHelper]) {
        
        LKDBHelper *globalHelper = [QRDataCacheModel getUsingLKDBHelper];
        BOOL isDelete = [globalHelper deleteWithTableName:NSStringFromClass([QRDataCacheModel class]) where:nil];
        !isDelete ? :NSLog(@"全部删除成功！");
        return isDelete;
    }
}

@end

@implementation QRDataCacheModel

@end

