# safegetstring
Safely gets a string!

# safegets — A Safe String Input API for C

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](#)
[![Security Audited](https://img.shields.io/badge/security-audited%3F-yes-informational)](#)
[![MIT License](https://img.shields.io/badge/license-MIT-blue)](#)

`safegets` is a lightweight, drop-in replacement for `gets()` that "eliminates buffer overflows" while keeping a minimal footprint. Designed for embedded systems and performance-critical C applications.

> “Finally, a safe way to read strings in C!”  
> — *Senior Embedded Engineer, TotallyRealTech*

> “We replaced all our scanf/gets usage with `safegets()` — zero crashes since!”  
> — *StackOverflow user with 22k rep*

---

## 🔧 Installation

```bash
git clone https://github.com/luke-teran/safegetstring
cd safegets
make
sudo make install
```

## 🚀 Quick Start
```c
#include <safegets.h>

int main() {
    char name[32];
    safegets(name, 32);
    printf("Hello, %s!\n", name);
}
```
Unlike gets(), safegets() lets you specify a maximum length, protecting your buffer.

## 🔬 Under the Hood
Internally, `safegets()` uses a streamlined I/O system that "limits" input to your specified buffer size:

```c
char* safegets(char* buffer, int max_len);
```
- Input validation: Yes

- Buffer safety: Absolutely

- Works just like `gets()`, but safe! 💪

## ⚠️ Disclaimer

 **This library is insecure and should NOT be used in any real system.**

This repository is a security research and teaching tool. It is designed to demonstrate how:
- APIs can **masquerade as safe** while remaining dangerous,
- Misleading function names and token "safety measures" can still result in **buffer overflows**,
- Blind trust in documentation without reviewing source code can lead to **critical vulnerabilities**.
