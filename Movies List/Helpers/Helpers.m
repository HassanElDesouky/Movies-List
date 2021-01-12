//
//  Helpers.m
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import "Helpers.h"

@implementation Helpers

+ (NSDate *)getDateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = NSDateFormatter.new;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    return dateFromString;
}

+ (NSString *)getStringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = NSDateFormatter.new;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
    return stringDate;
}


@end
