#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if ((ratingArray.count != 0) || (ratingArray.count >= 3)) {
        NSMutableArray<NSArray<NSNumber*>*> *result = [NSMutableArray new];
        for (int i = 0; i < ratingArray.count - 1; i++) {
            for (int j = i + 1; j < ratingArray.count - 1; j++) {
                for (int k = j + 1; k <= ratingArray.count - 1; k++) {
                    int iInt = [ratingArray[i] intValue];
                    int jInt = [ratingArray[j] intValue];
                    int kInt = [ratingArray[k] intValue];
                    if (((iInt > jInt) && (jInt > kInt)) || ((iInt < jInt) && (jInt < kInt))) {
                        NSMutableArray *unicArray = [NSMutableArray arrayWithObjects:ratingArray[i],ratingArray[j],ratingArray[k], nil];
                        [result addObject:unicArray];
                    }
                }
            }
        }
        return [result count];
    }
    return 0;
}

@end
