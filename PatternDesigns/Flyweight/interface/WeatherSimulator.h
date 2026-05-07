#import <Foundation/Foundation.h>
#import "RainDropFactory.h"

@interface WeatherSimulator : NSObject
- (void)simulateWithIntensity:(RainIntensity)intensity
                    dropCount:(NSInteger)count;
@end    
