#import <Foundation/Foundation.h>
#import "../protocol/CoffeeFlavorProtocol.h"

@interface Coffee : NSObject

@property (nonatomic, strong) id<CoffeeFlavorProtocol> flavor;

- (instancetype)initWithFlavor:(id<CoffeeFlavorProtocol>)flavor;

- (NSString *)size;
- (double)sizeMultiplier;
- (double)finalPrice;
- (void)serve;

@end
