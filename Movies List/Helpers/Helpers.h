//
//  Helpers.h
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Helpers : NSObject

+ (NSDate *)getDateFromString:(NSString *)dateString;
+ (NSString *)getStringFromDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
