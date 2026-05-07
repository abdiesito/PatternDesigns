
#import <Foundation/Foundation.h>
#import "RainDropType.h"

typedef NS_ENUM(NSInteger, RainIntensity) {
    RainIntensityDrizzle,
    RainIntensityModerate,
    RainIntensityStorm
};

@interface RainDropFactory : NSObject
+ (RainDropType *)dropForIntensity:(RainIntensity)intensity;
+ (NSInteger)cachedTypesCount;
@end
