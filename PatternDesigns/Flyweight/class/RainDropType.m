
#import "RainDropType.h"

@implementation RainDropType

- (instancetype)initWithTexture:(NSString *)texture
                          color:(NSString *)color
                           size:(CGFloat)size {
    self = [super init];
    if (self) {
        _texture = texture;
        _color   = color;
        _size    = size;
    }
    return self;
}

- (void)renderAtX:(CGFloat)x
                y:(CGFloat)y
          opacity:(CGFloat)opacity {
    NSLog(@"[Render] Textura: %-12@ | Color: %-8@ | Tamaño: %.1fpt "
          @"→ Pos(%.0f, %.0f) Opacidad: %.0f%%",
          _texture, _color, _size, x, y, opacity * 100);
}

@end
