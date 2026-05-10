# PatternDesigns

Implementación de **patrones de diseño estructurales** en **Objective-C**, desarrollada como proyecto de Xcode. 
Cada patrón se encuentra en su propia carpeta con separación entre interfaces (`.h`) y clases (`.m`).

---

## Estructura del repositorio

```
PatternDesigns/
├── Bridge/
│   ├── class/
│   │   ├── Coffee.m
│   │   ├── Americano.m
│   │   ├── Cappuccino.m
│   │   ├── Moka.m
│   │   ├── CoffeeSmall.m
│   │   ├── CoffeeMedium.m
│   │   └── CoffeeLarge.m
│   ├── interface/
│   │   ├── Coffee.h
│   │   ├── Americano.h
│   │   ├── Cappuccino.h
│   │   ├── Moka.h
│   │   ├── CoffeeSmall.h
│   │   ├── CoffeeMedium.h
│   │   └── CoffeeLarge.h
│   └── protocol/
│       └── CoffeeFlavorProtocol.h
├── Flyweight/
│   ├── class/
│   │   ├── RainDropFactory.m
│   │   ├── RainDropType.m
│   │   └── WeatherSimulator.m
│   ├── interface/
│   │   ├── RainDropFactory.h
│   │   ├── RainDropType.h
│   │   └── WeatherSimulator.h
│   └── protocol/
│       └── RainDrop.h
└── main.m
```

---

## Patrones implementados

### 1. Bridge

| | |
|---|---|
| **Categoría** | Estructural |
| **Carpeta** | `PatternDesigns/Bridge/` |

**Problema que resuelve:**
Cuando necesitas combinar dos jerarquías independientes (en este caso, *sabor de café* y *tamaño de café*), la herencia tradicional genera una explosión combinatoria de subclases. 
Bridge separa la abstracción de su implementación para que ambas puedan escalar de forma independiente.

**Para este ejemplo:**
- `CoffeeFlavorProtocol` define la interfaz de implementación (el "puente").
- `Americano`, `Cappuccino` y `Moka` implementan el protocolo, representando distintos sabores.
- `Coffee` es la abstracción base; `CoffeeSmall`, `CoffeeMedium` y `CoffeeLarge` son refinamientos que representan distintos tamaños.
- Cualquier tamaño puede combinarse con cualquier sabor sin crear una clase nueva por cada combinación.

```
Abstracción          Implementación
───────────          ──────────────
Coffee     ––––––––> CoffeeFlavorProtocol
  ├── CoffeeSmall         ├── Americano
  ├── CoffeeMedium        ├── Cappuccino
  └── CoffeeLarge         └── Moka
```

---

### 2. Flyweight

| | |
|---|---|
| **Categoría** | Estructural |
| **Carpeta** | `PatternDesigns/Flyweight/` |

**Problema que resuelve:**
Cuando se necesitan crear miles de objetos similares que comparten estado, el uso de memoria crece de forma inmanejable. 
Flyweight reutiliza objetos compartidos (con estado intrínseco) para reducir el consumo de memoria.

**Para este ejemplo:**
- `RainDrop` (protocolo) define la interfaz de las gotas de lluvia.
- `RainDropType` contiene el estado intrínseco compartido (tipo/color de gota).
- `RainDropFactory` actúa como caché: crea un `RainDropType` solo si no existe ya uno con ese tipo; de lo contrario reutiliza el existente.
- `WeatherSimulator` genera múltiples gotas reutilizando los tipos ya creados.

```
WeatherSimulator
     |
RainDropFactory –––(caché)––––> RainDropType (compartido)
                                   |–––> Pesada, ligera...
```

---

## Herramientas y versiones

| Herramienta | Versión recomendada | Versión utilizada |
|---|---|---|
| Lenguaje | Objective-C | |
| Xcode | 15 o superior | 26.0 |
| macOS | macOS X 10.0 o superior | macOS Tahoe 26.3.1(a) |
| SDK | macOS SDK (aplicación de consola) | macOS SDK 26.0 |

---

## Cómo ejecutar el proyecto

### Desde Xcode

```bash
# 1. Clona el repositorio
git clone https://github.com/abdiesito/PatternDesigns.git
cd PatternDesigns

# 2. Abre el proyecto en Xcode
open PatternDesigns.xcodeproj
```

Dentro de Xcode:
- Selecciona el esquema **PatternDesigns**
- Presiona **⌘ + R** para compilar y ejecutar
- La salida aparece en la consola de Xcode


> **Nota:** Se requiere tener instaladas las **Xcode Command Line Tools**.  
> Si no se tienen: `xcode-select --install`

---

## Instalación de dependencias

Este proyecto **no requiere dependencias externas**. Solo utiliza:
- **Foundation framework** (incluido en macOS)
- **Xcode Command Line Tools** o **Xcode** completo

```bash
# Verificar que las herramientas de línea de comandos estén instaladas
xcode-select -p

# Si no están instaladas:
xcode-select --install
```

---

## Resumen de clases y su rol en el patrón

### Bridge

| Clase / Protocolo | Rol en el patrón |
|---|---|
| `CoffeeFlavorProtocol` | Interfaz de implementación (Implementor) |
| `Americano`, `Cappuccino`, `Moka` | Implementaciones concretas (ConcreteImplementor) |
| `Coffee` | Abstracción base (Abstraction) |
| `CoffeeSmall`, `CoffeeMedium`, `CoffeeLarge` | Abstracciones refinadas (RefinedAbstraction) |

### Flyweight

| Clase / Protocolo | Rol en el patrón |
|---|---|
| `RainDrop` | Interfaz Flyweight |
| `RainDropType` | Flyweight concreto (estado intrínseco compartido) |
| `RainDropFactory` | Fábrica y caché de Flyweights |
| `WeatherSimulator` | Cliente que usa los Flyweights |

---
