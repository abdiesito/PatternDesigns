#import <Foundation/Foundation.h>
#import "RainDrop.h"

@interface RainDropType : NSObject <RainDrop>

@property (nonatomic, strong, readonly) NSString *texture;
@property (nonatomic, strong, readonly) NSString *color;
@property (nonatomic, assign, readonly) CGFloat   size;

- (instancetype)initWithTexture:(NSString *)texture
                          color:(NSString *)color
                           size:(CGFloat)size;
@end
