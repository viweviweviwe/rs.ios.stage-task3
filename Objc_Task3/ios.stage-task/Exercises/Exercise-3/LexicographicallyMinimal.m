#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *resultString = [NSMutableString string];
    NSMutableString *mutableString1 = [[NSMutableString alloc] initWithString:string1];
    NSMutableString *mutableString2 = [[NSMutableString alloc] initWithString:string2];
    
    while (mutableString1.length > 0 || mutableString2.length > 0) {
        NSComparisonResult compareResult = [mutableString1 compare:mutableString2];
        if((compareResult == NSOrderedAscending && mutableString1.length != 0) || (compareResult == NSOrderedDescending && mutableString2.length == 0)){
            [resultString appendString:[mutableString1 substringToIndex:1]];
            [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
        }else {
            [resultString appendString:[mutableString2 substringToIndex:1]];
            [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }

    return resultString;
}

@end
