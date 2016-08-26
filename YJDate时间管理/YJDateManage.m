//
//  YJDateManage.m
//  Collect
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 pengf. All rights reserved.
//
//常用的时间格式
//[dateFormatter setDateFormat:@"yyyy年MM月dd日#EEEE"];EEEE为星期几，EEE为周几
//[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//[dateFormatter setDateFormat:@"yyyy年MMMMd日"];//MMMM 为xx月，一个d可以省去01日前的0
#import "YJDateManage.h"

@implementation YJDateManage
+ (instancetype)shareManage{
    static YJDateManage *manage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manage) {
            manage = [[YJDateManage alloc] init];
        }
    });
    return manage;
}
#pragma mark -- 时间字符串之间的大小比较（YES 第一个时间较大）
- (BOOL)compareDateWithString:(NSString *)oneStr otherDate:(NSString *)twoStr dateFormater:(NSString *)fm{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formater setDateFormat:fm];
    NSDate *oneDate  = [formater dateFromString:oneStr];
    NSDate *twoDate = [formater dateFromString:twoStr];
    NSTimeInterval time = [oneDate timeIntervalSinceDate:twoDate];
    if (time > 0) {
        return YES;
    }else if(time == 0){
        return NO;
    }else{
        return NO;
    }
}
#pragma mark -- 时间转换为字符串
- (NSString *)dateToStringWith:(NSDate *)date formater:(NSString *)fm{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:fm];
    return [formater stringFromDate:date];
}
#pragma mark -- 字符串转化为时间
- (NSDate *)stringToDateWith:(NSString *)dateStr formater:(NSString *)fm{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formater setDateFormat:fm];
    return [formater dateFromString:dateStr];
}
#pragma mark -- 两个时间字符串的秒数差
- (NSTimeInterval)compareTwoDateString:(NSString *)oneStr twoString:(NSString *)twoStr formater:(NSString *)fm{
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formater setDateFormat:fm];
    NSDate *oneDate  = [formater dateFromString:oneStr];
    NSDate *twoDate = [formater dateFromString:twoStr];
    NSTimeInterval time = [oneDate timeIntervalSinceDate:twoDate];
    return time;
}
@end
