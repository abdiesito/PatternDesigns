#import "../interface/Moka.h"

@implementation Moka

- (NSString *)flavorName {
    return @"Moka";
}

- (double)basePrice {
    return 45.0;
}

- (void)brew {
    NSLog(@"🍫 Preparando espresso con chocolate...");
}

@end
