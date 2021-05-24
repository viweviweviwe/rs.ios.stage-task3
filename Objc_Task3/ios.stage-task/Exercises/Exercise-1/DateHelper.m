#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber <= 0 || monthNumber > 13) {
        return nil;
    }
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = monthNumber;
     
    NSCalendar *calendar = [NSCalendar currentCalendar] ;
    NSDate *date = [calendar dateFromComponents:dateComponents];
 
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MMMM"];

    NSString *dateString = [df stringFromDate:date];

    return dateString;
}
#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-M-dd'T'HH-mm-ss'Z'"];
    NSDate *myDate = [df dateFromString:date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:myDate];

    return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [df setLocalizedDateFormatFromTemplate:@"E"];

    return [df stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *todayWeekOfYear = [cal components:NSCalendarUnitWeekOfYear fromDate:[NSDate date]];
    NSDateComponents *inputWeekOfYear = [cal components:NSCalendarUnitWeekOfYear fromDate:date];

    if ([todayWeekOfYear weekOfYear] == [inputWeekOfYear weekOfYear]) {
        return YES;
    }
    return NO;
}

@end
