#import "../interface/Cappuccino.h"

@implementation Cappuccino

- (NSString *)flavorName {
    return @"Cappuccino";
}

- (double)basePrice {
    return 40.0;
}

- (void)brew {
    NSLog(@"☕ Preparando espresso con leche vaporizada...");
}

@end
