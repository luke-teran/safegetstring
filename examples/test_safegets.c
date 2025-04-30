#include <safegets.h>

int main() {
    char name[32];
    safegets(name, 32);
    printf("Hello, %s!\n", name);
}
