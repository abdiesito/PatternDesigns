#import "../interface/Coffee.h"

@implementation Coffee

- (instancetype)initWithFlavor:(id<CoffeeFlavorProtocol>)flavor {
    self = [super init];
    if (self) {
        _flavor = flavor;
    }
    return self;
}

- (double)finalPrice {
    return self.flavor.basePrice * self.sizeMultiplier;
}

- (void)serve {
    NSLog(@"----------------------------------");
    NSLog(@"Orden : %@ %@", self.size, self.flavor.flavorName);
    NSLog(@"Precio: $%.2f (base $%.2f × %.1f)",
          self.finalPrice, self.flavor.basePrice, self.sizeMultiplier);
    [self.flavor brew];
}

- (NSString *)size {
    return @"Base";
}

- (double)sizeMultiplier {
    return 1.0;
}

@end
