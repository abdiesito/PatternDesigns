#import <Foundation/Foundation.h>

@protocol RainDrop <NSObject>

- (void)renderAtX:(CGFloat)x
                y:(CGFloat)y
          opacity:(CGFloat)opacity;

@end
