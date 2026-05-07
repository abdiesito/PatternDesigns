
#import "RainDropFactory.h"

static NSMutableDictionary<NSNumber *, RainDropType *> *dropCache = nil;

@implementation RainDropFactory

+ (void)initialize {
    if (self == [RainDropFactory class]) {
        dropCache = [NSMutableDictionary dictionary];
    }
}

+ (RainDropType *)dropForIntensity:(RainIntensity)intensity {
    NSNumber *key = @(intensity);
    RainDropType *drop = dropCache[key];

    if (!drop) {
        switch (intensity) {
            case RainIntensityDrizzle:
                drop = [[RainDropType alloc] initWithTexture:@"drop_small.png"
                                                       color:@"#A8D8EA"
                                                        size:2.0];
                break;
            case RainIntensityModerate:
                drop = [[RainDropType alloc] initWithTexture:@"drop_medium.png"
                                                       color:@"#4A90D9"
                                                        size:4.0];
                break;
            case RainIntensityStorm:
                drop = [[RainDropType alloc] initWithTexture:@"drop_large.png"
                                                       color:@"#1B3A6B"
                                                        size:7.0];
                break;
        }
        dropCache[key] = drop;
        NSLog(@"[Factory] ✦ Nueva textura cargada en RAM: '%@'", drop.texture);
    }

    return drop;
}

+ (NSInteger)cachedTypesCount {
    return (NSInteger)dropCache.count;
}

@end
