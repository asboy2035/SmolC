# SmolC
Write C and Arduino functions at the speed of very fast.
**SmolC** is a ✨tiny but mighty✨ text expansion package for writing C and Arduino code **at the speed of light**.  
It's designed for devs who want to skip the finger gymnastics and get straight to the slay 💅

Made for use with [Espanso](https://espanso.org) – the ultimate open-source text expander.

## ✨ Features
- Speed up your Arduino/C workflows with cute shorthand triggers
- Auto-inserts semicolons and cursor positions `` for smooth typing
- Clean, readable expansions that map 1:1 to common Arduino/C++ APIs
- Slayfully minimal — no bloat, just *fast fingers and fab code*

## 🧪 Example Triggers

| Trigger | Expands to            |
|---------|-----------------------|
| `sP(`   | `Serial.print();`     |
| `sPL(`  | `Serial.println();`   |
| `aR(`   | `analogRead();`       |
| `dW(`   | `digitalWrite();`     |
| `pM(`   | `pinMode();`          |
| `mS`    | `millis()`            |
| `vS`    | `void setup() {\n\n}` |
| `cxB`   | `constexpr bool ;`    |
| `rV(`   | `return ;`            |
| `brk;`  | `break;`              |

> ✨ More expansions are available — check out `package.yml` for the full glow-up.


## 🛠️ Installation
#### Automatic
If you're on Linux/macOS, simply run `install.sh`.

#### Manual
1. Clone or download this repo
2. Move it to your Espanso packages folder:

```bash
# Example path on Linux/macOS
~/.config/espanso/packages/smolc
```
