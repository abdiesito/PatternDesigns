#import "../interface/Americano.h"

@implementation Americano

- (NSString *)flavorName {
    return @"Americano";
}

- (double)basePrice {
    return 30.0;
}

- (void)brew {
    NSLog(@"💧 Preparando espresso con agua caliente...");
}

@end
