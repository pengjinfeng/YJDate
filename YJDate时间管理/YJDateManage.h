//
//  YJDateManage.h
//  Collect
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 pengf. All rights reserved.
//

#import <Foundation/Foundation.h>
//常用的时间格式
//[dateFormatter setDateFormat:@"yyyy年MM月dd日#EEEE"];EEEE为星期几，EEE为周几
//[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//[dateFormatter setDateFormat:@"yyyy年MMMMd日"];//MMMM 为xx月，一个d可以省去01日前的0
@interface YJDateManage : NSObject
+ (instancetype)shareManage;
#pragma mark -- 时间字符串之间的大小比较（YES 第一个时间较大）
- (BOOL)compareDateWithString:(NSString *)oneStr otherDate:(NSString *)twoStr dateFormater:(NSString *)fm;
#pragma mark -- 时间转换为字符串
- (NSString *)dateToStringWith:(NSDate *)date formater:(NSString *)fm;
#pragma mark -- 字符串转化为时间
- (NSDate *)stringToDateWith:(NSString *)dateStr formater:(NSString *)fm;
#pragma mark -- 两个时间字符串的秒数差
- (NSTimeInterval)compareTwoDateString:(NSString *)oneStr twoString:(NSString *)twoStr formater:(NSString *)fm;
@end
