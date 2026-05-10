
#import "WeatherSimulator.h"

static const CGFloat kScreenWidth  = 390.0;
static const CGFloat kScreenHeight = 844.0;

@implementation WeatherSimulator

- (void)simulateWithIntensity:(RainIntensity)intensity
                    dropCount:(NSInteger)count {

    NSString *label;
    switch (intensity) {
        case RainIntensityDrizzle: label = @"Llovizna"; break;
        case RainIntensityModerate: label = @"Moderada"; break;
        case RainIntensityStorm: label = @"Tormenta"; break;
    }

    NSLog(@"\n═══════════════════════════════════");
    NSLog(@"  Simulando: %@ (%ld gotas)", label, (long)count);
    NSLog(@"═══════════════════════════════════");

    RainDropType *flyweight = [RainDropFactory dropForIntensity:intensity];

    for (NSInteger i = 0; i < count; i++) {
        CGFloat x = arc4random_uniform((uint32_t)kScreenWidth);
        CGFloat y = arc4random_uniform((uint32_t)kScreenHeight);
        CGFloat opacity = 0.4 + ((arc4random_uniform(60)) / 100.0);

        [flyweight renderAtX:x y:y opacity:opacity];
    }
}

@end
