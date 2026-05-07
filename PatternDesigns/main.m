
#import <Foundation/Foundation.h>

#import "Bridge/interface/Cappuccino.h"
#import "Bridge/interface/Moka.h"
#import "Bridge/interface/Americano.h"

#import "Bridge/interface/CoffeeSmall.h"
#import "Bridge/interface/CoffeeMedium.h"
#import "Bridge/interface/CoffeeLarge.h"

#import "WeatherSimulator.h"
#import "RainDropFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        id<CoffeeFlavorProtocol> cappuccino = [[Cappuccino alloc] init];
        id<CoffeeFlavorProtocol> moka = [[Moka alloc] init];
        id<CoffeeFlavorProtocol> americano  = [[Americano alloc] init];

        NSLog(@"=== Moka en todos los tamaños ===");
        Coffee *mokaChico = [[CoffeeSmall alloc] initWithFlavor:moka];
        Coffee *mokaMediano = [[CoffeeMedium alloc] initWithFlavor:moka];
        Coffee *mokaGrande = [[CoffeeLarge alloc] initWithFlavor:moka];

        [mokaChico serve];
        [mokaMediano serve];
        [mokaGrande serve];

        NSLog(@"\n=== Tamaño Mediano con distintos sabores ===");
        Coffee *medianoCappuccino = [[CoffeeMedium alloc] initWithFlavor:cappuccino];
        Coffee *medianoMoka = [[CoffeeMedium alloc] initWithFlavor:moka];
        Coffee *medianoAmericano = [[CoffeeMedium alloc] initWithFlavor:americano];

        [medianoCappuccino serve];
        [medianoMoka serve];
        [medianoAmericano serve];

        NSLog(@"\n=== Cambio de sabor en tiempo de ejecución ===");
        Coffee *orden = [[CoffeeLarge alloc] initWithFlavor:cappuccino];
        [orden serve];

        orden.flavor = americano;
        [orden serve];
        
        NSLog(@"\n============================================================================================");
        
        WeatherSimulator *simulator = [[WeatherSimulator alloc] init];

                [simulator simulateWithIntensity:RainIntensityDrizzle  dropCount:5];
                [simulator simulateWithIntensity:RainIntensityStorm    dropCount:5];
                [simulator simulateWithIntensity:RainIntensityModerate dropCount:5];

                NSLog(@"\n--- Segunda ronda (reutilizando flyweights) ---");
                [simulator simulateWithIntensity:RainIntensityStorm dropCount:3];

                NSLog(@"\n✔ Texturas únicas en RAM: %ld (sin importar cuántas gotas se renderizaron)",
                      (long)[RainDropFactory cachedTypesCount]);
        
    }
    return 0;
}
